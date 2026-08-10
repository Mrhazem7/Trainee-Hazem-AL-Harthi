'use strict';
const state = {
  current: '0',      
  previous: null,      
  operator: null,       
  overwrite: true,       
  history: []        
};

const MAX_DIGITS = 14;

const displayEl = document.getElementById('display');
const historyLineEl = document.getElementById('history');
const historyPanelEl = document.getElementById('history-panel');
const historyListEl = document.getElementById('history-list');
const modeDotEl = document.getElementById('mode-dot');
const keypadEl = document.getElementById('keypad');
const clearHistoryBtn = document.getElementById('clear-history-btn');

function calculate(a, op, b) {
  const numA = parseFloat(a);
  const numB = parseFloat(b);
  switch (op) {
    case '+': return numA + numB;
    case '-': return numA - numB;
    case '*': return numA * numB;
    case '/':
      if (numB === 0) return null; 
      return numA / numB;
    default: return numB;
  }
}

function formatNumber(value) {
  if (value === null || Number.isNaN(value)) return 'خطأ';
  let str = String(value);
  if (str.length > MAX_DIGITS) {
 
    str = Number(value).toPrecision(10).toString();
  }
  return str;
}

function inputDigit(digit) {
  if (state.overwrite) {
    state.current = digit === '.' ? '0.' : digit;
    state.overwrite = false;
    return;
  }
  if (state.current.length >= MAX_DIGITS) return;
  state.current += digit;
}

function inputDecimal() {
  if (state.overwrite) {
    state.current = '0.';
    state.overwrite = false;
    return;
  }
  if (!state.current.includes('.')) {
    state.current += '.';
  }
}

function chooseOperator(op) {
  if (state.operator && !state.overwrite) {
   
    const result = calculate(state.previous, state.operator, state.current);
    pushHistory(`${state.previous} ${symbolFor(state.operator)} ${state.current}`, result);
    state.previous = result === null ? '0' : formatNumber(result);
    state.current = state.previous;
  } else {
    state.previous = state.current;
  }
  state.operator = op;
  state.overwrite = true;
}

function equals() {
  if (state.operator === null) return;
  const result = calculate(state.previous, state.operator, state.current);
  const expression = `${state.previous} ${symbolFor(state.operator)} ${state.current}`;
  pushHistory(expression, result);

  state.current = result === null ? '0' : formatNumber(result);
  state.previous = null;
  state.operator = null;
  state.overwrite = true;

  if (result === null) flashError();
}

function clearAll() {
  state.current = '0';
  state.previous = null;
  state.operator = null;
  state.overwrite = true;
}

function deleteLast() {
  if (state.overwrite) return;
  state.current = state.current.slice(0, -1);
  if (state.current === '' || state.current === '-') {
    state.current = '0';
    state.overwrite = true;
  }
}

function pushHistory(expression, result) {
  state.history.unshift({
    expression,
    result: result === null ? 'خطأ' : formatNumber(result)
  });
  if (state.history.length > 20) state.history.pop();
}

function clearHistory() {
  state.history = [];
  renderHistory();
}

function symbolFor(op) {
  return { '+': '+', '-': '−', '*': '×', '/': '÷' }[op] || op;
}

function render() {
  displayEl.textContent = formatNumber(state.current) === 'خطأ'
    ? 'خطأ'
    : state.current;

  historyLineEl.textContent = state.operator
    ? `${state.previous} ${symbolFor(state.operator)}`
    : '\u00A0';

  renderHistory();
}

function renderHistory() {
  
  historyListEl.innerHTML = '';

  if (state.history.length === 0) {
    const empty = document.createElement('li');
    empty.className = 'history-empty';
    empty.textContent = 'لا توجد عمليات بعد';
    historyListEl.appendChild(empty);
    return;
  }

  state.history.forEach(entry => {
    const li = document.createElement('li');

    const exprSpan = document.createElement('span');
    exprSpan.textContent = entry.expression;

    const resSpan = document.createElement('span');
    resSpan.textContent = '= ' + entry.result;
    resSpan.style.opacity = '0.8';

    li.appendChild(exprSpan);
    li.appendChild(resSpan);
    historyListEl.appendChild(li);
  });
}

function flashError() {
  modeDotEl.classList.add('error');
  setTimeout(() => modeDotEl.classList.remove('error'), 600);
}

function toggleHistoryPanel() {
  historyPanelEl.classList.toggle('open');
}

keypadEl.addEventListener('click', (event) => {
  const btn = event.target.closest('.key');
  if (!btn) return;

  btn.classList.add('pressed');
  setTimeout(() => btn.classList.remove('pressed'), 100);

  const { num, op, action } = btn.dataset;

  if (num !== undefined) {
    inputDigit(num);
  } else if (op !== undefined) {
    chooseOperator(op);
  } else if (action === 'decimal') {
    inputDecimal();
  } else if (action === 'clear') {
    clearAll();
  } else if (action === 'delete') {
    deleteLast();
  } else if (action === 'equals') {
    equals();
  } else if (action === 'toggle-history') {
    toggleHistoryPanel();
  }

  render();
});

clearHistoryBtn.addEventListener('click', clearHistory);

document.addEventListener('keydown', (event) => {
  const { key } = event;
  if (/^[0-9]$/.test(key)) {
    inputDigit(key);
  } else if (['+', '-', '*', '/'].includes(key)) {
    chooseOperator(key);
  } else if (key === '.') {
    inputDecimal();
  } else if (key === 'Enter' || key === '=') {
    event.preventDefault();
    equals();
  } else if (key === 'Backspace') {
    deleteLast();
  } else if (key === 'Escape') {
    clearAll();
  } else {
    return; 
  }
  render();
});

render();
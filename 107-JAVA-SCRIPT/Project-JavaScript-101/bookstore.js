let books = [
    [1, "فاتتني صلاة", "إسلام جمال", 25.0, 13],
    [2, "الأب الغني والأب الفقير", "روبرت كيوساكي", 45.0, 22],
    [3, "من أقوال خالد الفيصل", "خالد الفيصل", 60.0, 5],
    [4, "كيف تقول لا", "سوزان نيومان", 55.0, 12],
    [5, "موسوعة الطب الشعبي والعلاج البديل", "د. أيمن الحسيني", 40.0, 9]

    
];
const ID = 0;
const TITLE = 1;
const AUTHOR = 2;
const PRICE = 3;
const QUANTITY = 4;

function addBook(id, title, author, price, quantity) {
    books.push([id, title, author, price, quantity]);
    console.log(`تمت إضافة الكتاب "${title}" بنجاح.`);
}
function deleteBook(id) {
    for (let i = 0; i < books.length; i++) {
        if (books[i][ID] === id) {
            let deletedTitle = books[i][TITLE];
            books.splice(i, 1);
            console.log(`تم حذف الكتاب "${deletedTitle}" بنجاح.`);
            return;
        }
    }
    console.log(`لم يتم العثور على كتاب بالرقم ${id}.`);
}
function editBook(id, newTitle, newAuthor, newPrice, newQuantity) {
    for (let i = 0; i < books.length; i++) {
        if (books[i][ID] === id) {
            if (newTitle !== undefined) books[i][TITLE] = newTitle;
            if (newAuthor !== undefined) books[i][AUTHOR] = newAuthor;
            if (newPrice !== undefined) books[i][PRICE] = newPrice;
            if (newQuantity !== undefined) books[i][QUANTITY] = newQuantity;
            console.log(`تم تعديل بيانات الكتاب رقم ${id} بنجاح.`);
            return;
        }
    }
    console.log(`لم يتم العثور على كتاب بالرقم ${id}.`);
}

function displayBooks() {
    console.log("===== قائمة الكتب المتوفرة =====");
    for (let i = 0; i < books.length; i++) {
        let book = books[i];
        console.log(
            `ID: ${book[ID]} | Title: ${book[TITLE]} | Author: ${book[AUTHOR]} | Price: ${book[PRICE]} | Quantity: ${book[QUANTITY]}`
        );
    }
    console.log("=================================");
}
function searchBook(id) {
    for (let i = 0; i < books.length; i++) {
        if (books[i][ID] === id) {
            console.log("----- نتيجة الاستعلام -----");
            console.log(`Book Id: ${books[i][ID]}`);
            console.log(`Title: ${books[i][TITLE]}`);
            console.log(`Author: ${books[i][AUTHOR]}`);
            console.log("----------------------------");
            return books[i];
        }
    }
    console.log(`لا يوجد كتاب بالرقم ${id}.`);
    return null;
}
function sellBook(bookTitle, requestedQuantity, customerBalance) {
    let foundBook = null;

    for (let i = 0; i < books.length; i++) {
        if (books[i][TITLE].toLowerCase() === bookTitle.toLowerCase()) {
            foundBook = books[i];
            break;
        }
    }

    if (!foundBook) {
        console.log(`عملية البيع فشلت: الكتاب "${bookTitle}" غير موجود في المكتبة.`);
        return;
    }

    if (foundBook[QUANTITY] < requestedQuantity) {
        console.log(
            `عملية البيع فشلت: الكمية المتوفرة من "${foundBook[TITLE]}" هي ${foundBook[QUANTITY]} فقط، وطلبت ${requestedQuantity}.`
        );
        return;
    }

    let totalPrice = foundBook[PRICE] * requestedQuantity;

    if (customerBalance < totalPrice) {
        console.log(
            `عملية البيع فشلت: رصيدك (${customerBalance}) لا يكفي لشراء ${requestedQuantity} نسخة من "${foundBook[TITLE]}" (المطلوب: ${totalPrice}).`
        );
        return;
    }

    foundBook[QUANTITY] -= requestedQuantity;

    console.log("========== فاتورة الشراء ==========");
    console.log(`الكتاب: ${foundBook[TITLE]}`);
    console.log(`المؤلف: ${foundBook[AUTHOR]}`);
    console.log(`سعر النسخة: ${foundBook[PRICE]}`);
    console.log(`الكمية: ${requestedQuantity}`);
    console.log(`الإجمالي: ${totalPrice}`);
    console.log(`الرصيد المتبقي: ${customerBalance - totalPrice}`);
    console.log("====================================");
}
displayBooks();

console.log("\n--- إضافة كتاب جديد ---");
addBook(6, "Atomic Habits", "James Clear", 55.0, 10);

console.log("\n--- الاستعلام عن كتاب ---");
searchBook(3);

console.log("\n--- تعديل بيانات كتاب ---");
editBook(4, undefined, undefined, 40.0, undefined);
displayBooks();

console.log("\n--- عملية بيع ناجحة ---");
sellBook("Clean Code", 2, 200);

console.log("\n--- عملية بيع فاشلة (رصيد غير كافي) ---");
sellBook("Start with why", 1, 20);

console.log("\n--- عملية بيع فاشلة (كمية غير متوفرة) ---");
sellBook("Zero to One", 100, 5000);

console.log("\n--- حذف كتاب ---");
deleteBook(6);
displayBooks();
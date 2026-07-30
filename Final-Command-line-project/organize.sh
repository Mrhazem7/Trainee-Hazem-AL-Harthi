#!/bin/bash
set -uo pipefail

TARGET_DIR="${1:-.}"
LOG_FILE="${TARGET_DIR}/organize.log"

log() {
    local msg="$1"
    local ts
    ts=$(date '+%Y-%m-%d %H:%M:%S')
    echo "[$ts] $msg" | tee -a "$LOG_FILE" > /dev/null
    echo "[$ts] $msg"
}

if [ ! -d "$TARGET_DIR" ]; then
    echo "خطأ: المجلد '$TARGET_DIR' غير موجود." >&2
    exit 1
fi

{
    echo "===================================================="
    echo " بدء عملية تنظيم الملفات - $(date '+%Y-%m-%d %H:%M:%S')"
    echo " المجلد المستهدف: $TARGET_DIR"
    echo "===================================================="
} > "$LOG_FILE"

log "بدء الفحص عن الملفات داخل: $TARGET_DIR"

find "$TARGET_DIR" -maxdepth 1 -type f ! -name "organize.log" ! -name "$(basename "$0")" | while read -r file; do

    filename=$(basename -- "$file")

    if [[ "$filename" == *.* && "$filename" != .* ]]; then
        ext="${filename##*.}"
        ext=$(echo "$ext" | tr '[:upper:]' '[:lower:]')
    else
        ext="no_extension"
    fi

    dest_dir="${TARGET_DIR}/${ext}_files"
    mkdir -p "$dest_dir"

    if mv -- "$file" "$dest_dir/" 2>>"$LOG_FILE"; then
        log "تم نقل: '$filename'  ->  ${ext}_files/"
    else
        log "فشل نقل: '$filename' (راجع تفاصيل الخطأ في السجل)"
    fi
done

log "----------------------------------------------------"
log "ملخص النتائج بعد التنظيم:"

find "$TARGET_DIR" -mindepth 1 -maxdepth 1 -type d -name "*_files" | while read -r d; do
    count=$(find "$d" -type f | wc -l)
    log "  - $(basename "$d"): $count ملف/ملفات"
done

log "انتهت عملية التنظيم بنجاح."
log "===================================================="

echo ""
echo "تم الانتهاء. راجع ملف السجل الكامل هنا: $LOG_FILE"
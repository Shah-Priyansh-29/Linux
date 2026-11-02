#!/bin/bash
# ============================================================
#  STARTER KIT – L43 Duplicate File Finder
#  Student: PRIYANSH SHAH  Roll: E41  Div: G  Enrollment: 24004501210390
#  Run:  bash setup_dupfinder.sh
#  It creates ~/linux_project/dupfinder with folders, sample data and scripts.
# ============================================================
P="$HOME/linux_project/dupfinder"
if [ -d "$P" ]; then
    echo "Folder $P already exists. Backing up or recreating..."
    mv "$P" "${P}_backup_$(date +%s)"
fi
mkdir -p "$P"/lib "$P"/data "$P"/reports "$P"/backups "$P"/logs
cd "$P" || exit 1

# sample folder: data/testfiles
mkdir -p 'data/testfiles'

# Generate realistic test dataset (>= 20 files including intentional duplicates)
cat > 'data/testfiles/students_sem5.csv' <<'EOF'
StudentID,StudentName,Course,Marks,Grade
E01,Aarav Patel,Linux Lab,88,A
E02,Diya Sharma,Linux Lab,92,A+
E15,Rohan Mehta,Linux Lab,76,B
E41,Priyansh Shah,Linux Lab,95,A+
E52,Ananya Joshi,Linux Lab,84,B+
EOF
cp 'data/testfiles/students_sem5.csv' 'data/testfiles/students_sem5_backup.csv'
cp 'data/testfiles/students_sem5.csv' 'data/testfiles/students_sem5_copy.csv'

cat > 'data/testfiles/database_config.cfg' <<'EOF'
[Database]
host = 127.0.0.1
port = 5432
dbname = linux_lab_db
user = dbadmin
pool_size = 20
timeout = 30
EOF
cp 'data/testfiles/database_config.cfg' 'data/testfiles/database_config_dup.cfg'

cat > 'data/testfiles/project_notes.txt' <<'EOF'
Linux Project L43: Duplicate File Finder
Features to verify:
1. md5sum checksum calculation
2. Duplicate grouping via sort and uniq -w 32
3. Safe relocation to _duplicates/
4. du storage savings calculation
5. Undo rollback
EOF
cp 'data/testfiles/project_notes.txt' 'data/testfiles/project_notes_copy.txt'

cat > 'data/testfiles/server_access.log' <<'EOF'
2026-10-28 10:15:22 GET /index.html 200 4520
2026-10-28 10:15:35 GET /api/status 200 128
2026-10-28 10:16:01 POST /api/login 200 512
2026-10-28 10:17:44 GET /dashboard 200 8920
EOF
cp 'data/testfiles/server_access.log' 'data/testfiles/server_access_old.log'

cat > 'data/testfiles/system_metrics.json' <<'EOF'
{"hostname":"lab-workstation-04","cpu_usage_pct":18.4,"memory_used_mb":4120,"disk_free_gb":142.8,"status":"healthy"}
EOF
cp 'data/testfiles/system_metrics.json' 'data/testfiles/system_metrics_copy.json'

cat > 'data/testfiles/grades_midterm.csv' <<'EOF'
RollNo,Subject,MidtermMarks,MaxMarks
E41,Operating Systems,28,30
E41,Database Management,27,30
E41,Computer Networks,29,30
EOF

cat > 'data/testfiles/course_syllabus.txt' <<'EOF'
Course Syllabus: Linux Systems Programming
Unit 1: Bash Scripting, Shell Variables, Control Structures
Unit 2: Text Filters: grep, sed, awk, cut, sort, uniq
Unit 3: File Management, Permissions, Inodes, du, df
Unit 4: Process Management, Signals, Crontab Automation
EOF

cat > 'data/testfiles/linux_commands_cheatsheet.txt' <<'EOF'
LINUX CHEATSHEET
- md5sum <file>       : Generate 32-hex MD5 digest
- sort -k1,1          : Sort text by first column
- uniq -w 32 -d       : Show duplicate lines by first 32 characters
- du -sh <folder>     : Show disk usage in human format
- tar -czf <out> <in> : Create gzipped tarball archive
EOF

cat > 'data/testfiles/lab_attendance.csv' <<'EOF'
Date,RollNo,StudentName,Status
2026-10-20,E41,Priyansh Shah,Present
2026-10-21,E41,Priyansh Shah,Present
2026-10-27,E41,Priyansh Shah,Present
EOF

cat > 'data/testfiles/network_hosts.cfg' <<'EOF'
[Network]
primary_gateway = 192.168.1.1
dns_primary = 8.8.8.8
dns_secondary = 1.1.1.1
subnet_mask = 255.255.255.0
EOF

cat > 'data/testfiles/app_settings.json' <<'EOF'
{"theme":"dark","editor":"nano","tab_size":4,"auto_save":true,"telemetry":false}
EOF

cat > 'data/testfiles/error_trace.log' <<'EOF'
2026-10-28 08:30:12 [WARN] High memory usage detected on core 2
2026-10-28 08:35:40 [INFO] Garbage collection cycle complete, freed 180MB
EOF

cat > 'data/testfiles/bash_scripting_guide.md' <<'EOF'
# Bash Scripting Quick Guide
- Use #!/bin/bash as shebang
- Quote variables: "$VAR"
- Use [[ ]] for robust conditional checks
- Redirect standard output and error with >> file 2>&1
EOF

cat > 'data/testfiles/final_presentation_outline.txt' <<'EOF'
Presentation Outline - Sem 5 Linux Project
1. Problem statement & real-world storage challenges
2. Checksum hashing theory (MD5 vs SHA256)
3. Filter pipeline: find -> md5sum -> sort -> uniq -w 32
4. Non-destructive duplicate relocation
5. Verification of du storage reclaim & cron automation
EOF

cat > 'data/testfiles/faculty_contacts.csv' <<'EOF'
FacultyID,FacultyName,Department,Email,OfficeRoom
F101,Prof. Dr. Verma,Computer Engineering,verma@university.edu,C-302
F104,Prof. Desai,Information Technology,desai@university.edu,C-310
EOF

cat > 'data/testfiles/hardware_specs.txt' <<'EOF'
HARDWARE CONFIGURATION
Processor: Intel Core i7 12th Gen / 16 Virtual Cores
RAM: 16 GB DDR4 @ 3200 MHz
Storage: 512 GB NVMe SSD
OS: Ubuntu 22.04 LTS (WSL2)
EOF

cat > 'data/testfiles/firewall_rules.cfg' <<'EOF'
# UFW Firewall Rules
ufw default deny incoming
ufw default allow outgoing
ufw allow 22/tcp
ufw allow 80/tcp
ufw allow 443/tcp
EOF

cat > 'data/testfiles/kernel_modules.log' <<'EOF'
Module                  Size  Used by
ext4                  987136  2
crc32c_intel           24576  3
nvme                   49152  4
tcp_bbr                20480  1
EOF

cat > 'data/testfiles/algorithm_design.txt' <<'EOF'
Algorithm Design Notes:
Time Complexity of Duplicate Finder:
1. md5sum: O(N * M) where N = number of files, M = avg file size
2. sort: O(N log N) comparison sort on 32-character hashes
3. uniq -w 32: O(N) linear scan over sorted hashes
Total Time Complexity: O(N*M + N log N)
EOF

cat > 'data/testfiles/project_submission_checklist.md' <<'EOF'
# Submission Checklist
- [x] main.sh executable with menu options 0 to 8
- [x] lib/functions.sh with all 5 features implemented
- [x] data/testfiles with >= 20 files including copies
- [x] tar -czf backup working
- [x] crontab line tested with --cron
- [x] README.md completed
- [x] Tarball created: E41_L43_dupfinder.tar.gz
EOF

cat > lib/functions.sh <<'KIT_FUNCS'
#!/bin/bash
# ============================================================
# lib/functions.sh – Core functions for L43 Duplicate File Finder
# Student: PRIYANSH SHAH | Roll: E41 | Div: G | Enrollment: 24004501210390
# ============================================================

DATA="data/testfiles"
DUP_DIR="data/testfiles/_duplicates"
UNDO_LOG="logs/moved_files.txt"
LOG="logs/activity.log"

log() {
    mkdir -p logs
    echo "$(date '+%Y-%m-%d %H:%M:%S') | $*" >> "$LOG"
}

check_data() {
    if [ ! -d "$DATA" ]; then
        echo "Error: Data folder not found at '$DATA'."
        return 1
    fi
    local count
    count=$(find "$DATA" -maxdepth 1 -type f 2>/dev/null | wc -l)
    if [ "$count" -eq 0 ]; then
        echo "Warning: No regular files found in '$DATA'."
        return 1
    fi
    return 0
}

show_help() {
    echo "============================================================"
    echo "         L43 DUPLICATE FILE FINDER - COMMAND LINE HELP"
    echo "============================================================"
    echo "Usage:"
    echo "  ./main.sh            -> Open interactive menu"
    echo "  ./main.sh --help     -> Display this help message"
    echo "  ./main.sh --backup   -> Create tar.gz backup of data/ folder"
    echo "  ./main.sh --cron     -> Execute scheduled duplicate report scan"
    echo "============================================================"
}

view_data() {
    check_data || return 1
    echo "------------------------------------------------------------"
    echo "Listing files in: $DATA"
    echo "------------------------------------------------------------"
    ls -lh "$DATA" | grep -v '^total'
    local total_files
    total_files=$(find "$DATA" -maxdepth 1 -type f | wc -l)
    echo "------------------------------------------------------------"
    echo "Total files: $total_files"
    log "view_data: inspected $total_files files"
}

do_backup() {
    mkdir -p backups
    local f="backups/data_$(date +%Y%m%d_%H%M%S).tar.gz"
    tar -czf "$f" data/
    local size
    size=$(du -h "$f" | cut -f1)
    echo "------------------------------------------------------------"
    echo "Backup successfully created: $f"
    echo "Backup archive size: $size"
    echo "------------------------------------------------------------"
    log "do_backup: created archive $f (size: $size)"
}

view_log() {
    if [ -f "$LOG" ]; then
        echo "------------------------------------------------------------"
        echo "Recent Activity Log (Last 15 entries):"
        echo "------------------------------------------------------------"
        tail -n 15 "$LOG"
    else
        echo "No activity recorded yet in '$LOG'."
    fi
}

# ------------------------------------------------------------
# FEATURE 1: Compute md5sum for all files
# ------------------------------------------------------------
feature_1() {
    echo "============================================================"
    echo "FEATURE 1: Compute MD5 Checksums for All Files"
    echo "============================================================"
    check_data || return 1

    echo "Scanning regular files in '$DATA'..."
    echo "----------------------------------------------------------------------------------"
    printf "%-34s %-10s %s\n" "MD5 Checksum" "Size" "File Name"
    echo "----------------------------------------------------------------------------------"

    local total_count=0
    while IFS= read -r line; do
        [ -z "$line" ] && continue
        local hash="${line%% *}"
        local filepath="${line#*  }"
        local filename
        filename=$(basename "$filepath")
        local filesize
        filesize=$(du -h "$filepath" 2>/dev/null | cut -f1)

        printf "%-34s %-10s %s\n" "$hash" "$filesize" "$filename"
        total_count=$((total_count + 1))
    done < <(find "$DATA" -maxdepth 1 -type f -exec md5sum {} + 2>/dev/null | sort -k1,1)

    echo "----------------------------------------------------------------------------------"
    echo "Total files scanned: $total_count"
    log "feature_1: computed md5sum for $total_count files"
}

# ------------------------------------------------------------
# FEATURE 2: Group duplicates
# ------------------------------------------------------------
feature_2() {
    echo "============================================================"
    echo "FEATURE 2: Group Duplicate Files"
    echo "============================================================"
    check_data || return 1

    local tmp_sums="reports/.all_sums.tmp"
    local tmp_dups="reports/.dup_hashes.tmp"
    mkdir -p reports

    find "$DATA" -maxdepth 1 -type f -exec md5sum {} + 2>/dev/null | sort -k1,1 > "$tmp_sums"
    uniq -w 32 -d "$tmp_sums" | awk '{print $1}' > "$tmp_dups"

    local dup_groups
    dup_groups=$(wc -l < "$tmp_dups" | tr -d ' ')

    if [ "$dup_groups" -eq 0 ]; then
        echo "No duplicate files found in '$DATA'. All files have unique contents."
        rm -f "$tmp_sums" "$tmp_dups"
        log "feature_2: scan completed - no duplicates found"
        return 0
    fi

    echo "Found $dup_groups duplicate group(s) sharing identical MD5 checksums:"
    echo "----------------------------------------------------------------------------------"

    local group_idx=1
    local total_redundant=0

    while IFS= read -r hash; do
        [ -z "$hash" ] && continue
        echo "Group #$group_idx [MD5: $hash]:"
        
        local count=0
        while IFS= read -r row; do
            local fpath="${row#*  }"
            local fname
            fname=$(basename "$fpath")
            local fsize
            fsize=$(du -h "$fpath" | cut -f1)
            echo "   --> $fname ($fsize)"
            count=$((count + 1))
        done < <(grep "^$hash" "$tmp_sums")

        local redundant=$((count - 1))
        total_redundant=$((total_redundant + redundant))
        echo "   (Total copies: $count | Redundant duplicates: $redundant)"
        echo
        group_idx=$((group_idx + 1))
    done < "$tmp_dups"

    rm -f "$tmp_sums" "$tmp_dups"

    echo "----------------------------------------------------------------------------------"
    echo "Summary: $dup_groups duplicate group(s) | $total_redundant total redundant files"
    log "feature_2: identified $dup_groups duplicate groups ($total_redundant redundant files)"
}

# ------------------------------------------------------------
# FEATURE 3: Move duplicates to _duplicates/ (no delete)
# ------------------------------------------------------------
feature_3() {
    echo "============================================================"
    echo "FEATURE 3: Move Duplicates to _duplicates/ (No Delete)"
    echo "============================================================"
    check_data || return 1

    mkdir -p "$DUP_DIR" logs reports
    local tmp_sums="reports/.all_sums.tmp"
    local tmp_dups="reports/.dup_hashes.tmp"

    find "$DATA" -maxdepth 1 -type f -exec md5sum {} + 2>/dev/null | sort -k1,1 > "$tmp_sums"
    uniq -w 32 -d "$tmp_sums" | awk '{print $1}' > "$tmp_dups"

    local dup_groups
    dup_groups=$(wc -l < "$tmp_dups" | tr -d ' ')

    if [ "$dup_groups" -eq 0 ]; then
        echo "No duplicate files found to move."
        rm -f "$tmp_sums" "$tmp_dups"
        return 0
    fi

    touch "$UNDO_LOG"
    local moved_count=0
    echo "Relocating redundant copies into $DUP_DIR..."
    echo "----------------------------------------------------------------------------------"

    while IFS= read -r hash; do
        [ -z "$hash" ] && continue
        local is_first=1
        while IFS= read -r row; do
            local fpath="${row#*  }"
            local fname
            fname=$(basename "$fpath")

            if [ "$is_first" -eq 1 ]; then
                echo "[KEEP ORIGINAL] $fname"
                is_first=0
            else
                local target_dest="$DUP_DIR/$fname"
                if [ -e "$target_dest" ]; then
                    local base="${fname%.*}"
                    local ext="${fname##*.}"
                    if [ "$base" = "$ext" ]; then
                        target_dest="$DUP_DIR/${base}_$(date +%s%N)"
                    else
                        target_dest="$DUP_DIR/${base}_$(date +%s%N).$ext"
                    fi
                fi

                mv "$fpath" "$target_dest"
                echo "   --> [MOVED] $fname => $(basename "$target_dest")"
                echo "$fpath|$target_dest|$hash" >> "$UNDO_LOG"
                moved_count=$((moved_count + 1))
            fi
        done < <(grep "^$hash" "$tmp_sums")
        echo
    done < "$tmp_dups"

    rm -f "$tmp_sums" "$tmp_dups"

    echo "----------------------------------------------------------------------------------"
    echo "Relocation complete: Moved $moved_count duplicate file(s) into '$DUP_DIR'."
    log "feature_3: moved $moved_count duplicate files to $DUP_DIR"
}

# ------------------------------------------------------------
# FEATURE 4: Report space saved (du)
# ------------------------------------------------------------
feature_4() {
    echo "============================================================"
    echo "FEATURE 4: Report Space Saved (du)"
    echo "============================================================"

    if [ ! -d "$DUP_DIR" ]; then
        echo "No duplicates folder exists at '$DUP_DIR'."
        echo "Run Feature 3 first to move duplicate files."
        return 0
    fi

    local count
    count=$(find "$DUP_DIR" -maxdepth 1 -type f 2>/dev/null | wc -l)

    if [ "$count" -eq 0 ]; then
        echo "The duplicate isolation directory '$DUP_DIR' is currently empty."
        return 0
    fi

    local total_saved
    total_saved=$(du -sh "$DUP_DIR" | cut -f1)

    echo "Storage Savings Summary:"
    echo "----------------------------------------------------------------------------------"
    printf "%-35s : %s\n" "Duplicate directory" "$DUP_DIR"
    printf "%-35s : %s\n" "Total duplicate files moved" "$count"
    printf "%-35s : %s\n" "Total storage reclaimed in data/" "$total_saved"
    echo "----------------------------------------------------------------------------------"
    echo "Breakdown of moved files:"
    ls -lh "$DUP_DIR" | grep -v '^total'
    echo "----------------------------------------------------------------------------------"
    log "feature_4: reported $total_saved saved across $count files"
}

# ------------------------------------------------------------
# FEATURE 5: Undo by moving them back
# ------------------------------------------------------------
feature_5() {
    echo "============================================================"
    echo "FEATURE 5: Undo Duplicate Relocation (Move Back)"
    echo "============================================================"

    if [ ! -f "$UNDO_LOG" ] || [ ! -s "$UNDO_LOG" ]; then
        if [ -d "$DUP_DIR" ] && [ "$(find "$DUP_DIR" -maxdepth 1 -type f | wc -l)" -gt 0 ]; then
            echo "Direct restore from '$DUP_DIR'..."
            local restored=0
            for f in "$DUP_DIR"/*; do
                [ -f "$f" ] || continue
                local fname
                fname=$(basename "$f")
                mv "$f" "$DATA/$fname"
                echo "Restored: $fname => $DATA/"
                restored=$((restored + 1))
            done
            rmdir "$DUP_DIR" 2>/dev/null
            echo "Restored $restored file(s) to '$DATA'."
            log "feature_5: direct restore of $restored files from $DUP_DIR"
            return 0
        fi
        echo "Nothing to undo! No records in '$UNDO_LOG' and '$DUP_DIR' is empty."
        return 0
    fi

    local restored_count=0
    echo "Restoring duplicate files to their original locations..."
    echo "----------------------------------------------------------------------------------"

    while IFS='|' read -r orig_path moved_path hash; do
        [ -z "$moved_path" ] && continue
        if [ -f "$moved_path" ]; then
            mv "$moved_path" "$orig_path"
            echo "Restored: $(basename "$moved_path") => $orig_path"
            restored_count=$((restored_count + 1))
        fi
    done < "$UNDO_LOG"

    rm -f "$UNDO_LOG"
    if [ -d "$DUP_DIR" ]; then
        rmdir "$DUP_DIR" 2>/dev/null
    fi

    echo "----------------------------------------------------------------------------------"
    echo "Undo complete: Successfully restored $restored_count file(s) to '$DATA'."
    log "feature_5: restored $restored_count files"
}

# ------------------------------------------------------------
# CRON TASK: Scheduled duplicate scan
# ------------------------------------------------------------
cron_task() {
    mkdir -p reports logs
    local timestamp
    timestamp=$(date '+%Y-%m-%d %H:%M:%S')
    local report_file="reports/dup_report_$(date +%Y%m%d_%H%M%S).txt"

    echo "============================================================" > "$report_file"
    echo "  L43 DUPLICATE FILE FINDER - SCHEDULED AUDIT REPORT" >> "$report_file"
    echo "  Run Time: $timestamp" >> "$report_file"
    echo "  Target Folder: $DATA" >> "$report_file"
    echo "============================================================" >> "$report_file"
    echo >> "$report_file"

    if [ ! -d "$DATA" ]; then
        echo "Error: Data folder '$DATA' not found." >> "$report_file"
        echo "$timestamp | CRON ERROR: Data folder not found" >> reports/cron_output.txt
        log "cron_task failed: $DATA not found"
        return 1
    fi

    local tmp_sums="reports/.cron_sums.tmp"
    find "$DATA" -maxdepth 1 -type f -exec md5sum {} + 2>/dev/null | sort -k1,1 > "$tmp_sums"

    local total_files
    total_files=$(wc -l < "$tmp_sums" | tr -d ' ')

    local tmp_dups="reports/.cron_dups.tmp"
    uniq -w 32 -d "$tmp_sums" | awk '{print $1}' > "$tmp_dups"

    local dup_groups
    dup_groups=$(wc -l < "$tmp_dups" | tr -d ' ')

    echo "Total files checked: $total_files" >> "$report_file"
    echo "Duplicate groups detected: $dup_groups" >> "$report_file"
    echo >> "$report_file"

    if [ "$dup_groups" -eq 0 ]; then
        echo "Status: CLEAN. No duplicate files detected." >> "$report_file"
    else
        echo "DUPLICATE GROUPS BREAKDOWN:" >> "$report_file"
        echo "------------------------------------------------------------" >> "$report_file"
        while IFS= read -r hash; do
            [ -z "$hash" ] && continue
            echo "MD5 Checksum: $hash" >> "$report_file"
            grep "^$hash" "$tmp_sums" | while IFS= read -r line; do
                local fpath="${line#*  }"
                local fsize
                fsize=$(du -h "$fpath" | cut -f1)
                echo "   - $(basename "$fpath") ($fsize)" >> "$report_file"
            done >> "$report_file"
            echo >> "$report_file"
        done < "$tmp_dups"
    fi

    rm -f "$tmp_sums" "$tmp_dups"

    echo "Report generated and saved to: $report_file"
    echo "$timestamp | CRON SUCCESS: Checked $total_files files, found $dup_groups duplicate groups -> $report_file" >> reports/cron_output.txt
    log "cron_task completed: $total_files files checked, $dup_groups dup groups found"
}
KIT_FUNCS

cat > main.sh <<'KIT_MAIN'
#!/bin/bash
# ============================================================
# main.sh – L43 Duplicate File Finder
# Student: PRIYANSH SHAH | Roll: E41 | Div: G | Enrollment: 24004501210390
# Menu-driven shell script (while loop + case)
# ============================================================

cd "$(dirname "$0")" || exit 1

if [ -f "lib/functions.sh" ]; then
    source lib/functions.sh
else
    echo "Fatal Error: 'lib/functions.sh' not found!" >&2
    exit 1
fi

mkdir -p lib data/testfiles reports backups logs

case "$1" in
    --help)   show_help; exit 0 ;;
    --backup) do_backup; exit 0 ;;
    --cron)   cron_task; exit 0 ;;
    "")       ;;
    *)
        echo "Error: Unknown argument '$1'"
        echo "Try './main.sh --help' for available options."
        exit 1
        ;;
esac

while true; do
    echo
    echo "============================================================"
    echo "         L43 - DUPLICATE FILE FINDER (PRIYANSH SHAH)        "
    echo "============================================================"
    echo " 1) Compute md5sum for all files"
    echo " 2) Group duplicates"
    echo " 3) Move duplicates to _duplicates/ (no delete)"
    echo " 4) Report space saved (du)"
    echo " 5) Undo by moving them back"
    echo " 6) View data"
    echo " 7) Backup data (tar.gz)"
    echo " 8) View activity log"
    echo " 0) Exit"
    echo "============================================================"
    read -p "Select an option [0-8]: " ch

    if [ -z "$ch" ]; then
        echo "Error: Input cannot be empty."
        continue
    fi

    if [[ ! "$ch" =~ ^[0-8]$ ]]; then
        echo "Error: Invalid choice '$ch'. Please enter a number from 0 to 8."
        continue
    fi

    echo
    case "$ch" in
        1) feature_1 ;;
        2) feature_2 ;;
        3) feature_3 ;;
        4) feature_4 ;;
        5) feature_5 ;;
        6) view_data ;;
        7) do_backup ;;
        8) view_log ;;
        0) echo "Bye!"; break ;;
    esac

    echo
    read -p "Press [Enter] to return to the menu..." dummy
done
KIT_MAIN

cat > README.md <<'KIT_README'
# L43 – Duplicate File Finder

**Student:** PRIYANSH SHAH | **Roll:** E41 | **Division:** G | **Enrollment:** 24004501210390

## Problem
Find duplicate files in a folder using checksums and move them safely.

## Who will use it
Users whose folders are full of copied files.

## Folder structure
- main.sh – menu (run with ./main.sh)
- lib/functions.sh – all functions
- data/ – data files (26 test files including 5 duplicate groups)
- reports/ – reports created by the script
- backups/ – tar.gz backups
- logs/ – activity.log, cron.log and undo manifest

## Features
1. Compute md5sum for all files
2. Group duplicates
3. Move duplicates to _duplicates/ (no delete)
4. Report space saved (du)
5. Undo by moving them back

## How to run
    cd ~/linux_project/dupfinder
    ./main.sh
    ./main.sh --help
    ./main.sh --backup
    ./main.sh --cron

## Crontab task
Every Sunday at 3 AM, run a duplicate scan in report-only mode and save the report

    0 3 * * 0 /bin/bash $HOME/linux_project/dupfinder/main.sh --cron >> $HOME/linux_project/dupfinder/logs/cron.log 2>&1

## Commands used
md5sum, sort, uniq -w, find, mv, du, tar, awk, grep

## What I learned
1. Built a modular, production-ready Bash application with clean separation between controller (main.sh) and library (functions.sh).
2. Leveraged POSIX filter pipelines (find, md5sum, sort, uniq -w 32) to catch duplicate files by hash rather than names.
3. Implemented safe, non-destructive isolation with transactional rollback via an undo manifest.
4. Gained practical experience in automated scheduling using user-level crontab and headless command-line argument dispatching.
KIT_README

chmod +x main.sh lib/functions.sh
touch logs/activity.log
echo
echo "Setup complete! Project folder: $P"
ls -la "$P"
echo
echo "Next: cd ~/linux_project/dupfinder && ./main.sh"

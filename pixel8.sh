
#!/usr/bin/env bash

# Google Pixel repositories
# Branch: lineage-24.0
# Device trees: LineageOS
# Vendor blobs: TheMuppets

BRANCH="lineage-24.0"

clone_repo() {
    local org="$1"
    local repo="$2"
    local path="$3"

    echo "========================================"
    echo "Repository: $org/$repo"
    echo "Target:     $path"
    echo "Branch:     $BRANCH"
    echo "========================================"

    if [ -d "$path/.git" ]; then
        echo "Already exists, skipping: $path"
        echo
        return 0
    fi

    if [ -e "$path" ]; then
        echo "ERROR: Path already exists: $path"
        echo
        return 1
    fi

    mkdir -p "$(dirname "$path")"

    if git clone --depth=1 -b "$BRANCH" \
        "https://github.com/$org/$repo.git" "$path"; then
        echo "SUCCESS: $path"
    else
        echo "FAILED: $org/$repo (branch: $BRANCH)"
    fi

    echo
}

# ==========================================
# Device repositories - LineageOS
# ==========================================

clone_repo "LineageOS" "android_device_google_akita" \
    "device/google/akita"

clone_repo "LineageOS" "android_device_google_akita-kernels" \
    "device/google/akita-kernels"

clone_repo "LineageOS" "android_device_google_shusky" \
    "device/google/shusky"

clone_repo "LineageOS" "android_device_google_zuma" \
    "device/google/zuma"

clone_repo "LineageOS" "android_device_google_shusky-kernels" \
    "device/google/shusky-kernels"

# ==========================================
# Vendor repositories - TheMuppets
# ==========================================

clone_repo "TheMuppets" "proprietary_vendor_google_akita" \
    "vendor/google/akita"

clone_repo "TheMuppets" "proprietary_vendor_google_husky" \
    "vendor/google/husky"

clone_repo "TheMuppets" "proprietary_vendor_google_shiba" \
    "vendor/google/shiba"

echo "========================================"
echo "All clone attempts completed!"
echo "========================================"

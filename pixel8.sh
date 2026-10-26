
#!/usr/bin/env bash

set -u

clone_repo() {
    local repo="$1"
    local dir="$2"

    mkdir -p "$(dirname "$dir")"

    if [ -d "$dir/.git" ]; then
        echo "[SKIP] $dir already exists"
    else
        echo "[CLONE] $repo -> $dir"
        if git clone "$repo" "$dir"; then
            echo "[OK] $dir"
        else
            echo "[FAIL] $repo"
        fi
    fi
}

echo "=================================="
echo "  Pixel Devices Repo Cloner"
echo "=================================="

# Pixel 8 (shiba / shusky)
clone_repo "https://github.com/LineageOS/android_device_google_shusky" "device/google/shusky"
clone_repo "https://github.com/LineageOS/android_device_google_shusky-kernels" "device/google/shusky-kernels"
clone_repo "https://github.com/LineageOS/android_device_google_zuma" "device/google/zuma"
clone_repo "https://github.com/LineageOS/android_device_google_gs-common" "device/google/gs-common"
clone_repo "https://github.com/TheMuppets/proprietary_vendor_google_shiba" "vendor/google/shiba"
clone_repo "https://github.com/TheMuppets/proprietary_vendor_google_husky" "vendor/google/husky"

# Pixel 8a (akita)
clone_repo "https://github.com/TheMuppets/proprietary_vendor_google_akita" "vendor/google/akita"
clone_repo "https://github.com/LineageOS/android_device_google_akita" "device/google/akita"
clone_repo "https://github.com/LineageOS/android_device_google_akita-kernels" "device/google/akita-kernels"

echo "=================================="
echo "  Repository cloning finished"
echo "=================================="

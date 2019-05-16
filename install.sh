#!/bin/bash

OS="DEFAULT"
ARCH="DEFAULT"

while [[ -n "$1" ]] ;do
    case "$1" in
        -o)
            OS="$2"
            if [[ "${OS}" != "darwin" && "${OS}" != "linux" ]]; then
                echo "BTFS does not support the operating system you entered, please re-enter   support:linux,darwin"
                exit
            fi
            shift 2
            ;;
        -a)
            ARCH="$2"
            if [[ "${ARCH}" != "amd64" && "${ARCH}" != "386" ]]; then
                echo "BTFS does not support the arch you entered, please re-enter   support:amd64,386"
                exit
            fi
            shift 2
            ;;
        *)
            exit 1
            ;;
    esac
done

if [[ "${ARCH}" = "DEFAULT" ]]; then
    echo "Please input operating system."
    exit
fi

if [[ "${OS}" = "DEFAULT" ]]; then
    echo "Please input arch."
    exit
fi

btfsPath=${HOME}/btfs

echo ${btfsPath}

if [[ -d "${btfsPath}" ]];then
    echo "~/btfs already exists, delete ~/btfs begin."
    rm -rf ${btfsPath}
    echo "Delete ~/btfs success!"
fi

mkdir ${HOME}/btfs
cp btfs-${OS}-${ARCH} ${HOME}/btfs/btfs
cp config_${OS}_${ARCH}.yaml ${HOME}/btfs/config.yaml

echo "Install btfs success!"
repo="https://github.com/nan0desu/vmware-host-modules.git"
branch="workstation-17.5.2-k6.9+"

workdir="/tmp"

# check if run as root
if [[ $EUID -ne 0 ]]; then
    echo "Error: Run this script as root"
    exit 1
fi

# clean previous
if [[ -d "$workdir/vmware-host-modules" ]]; then
    rm -rf "$workdir/vmware-host-modules" >/dev/null
fi

# cloning repo
git -C "$workdir" clone --branch $branch --depth 1 $repo >/dev/null

# going to the repo 
cd $workdir/vmware-host-modules/

# compiling
make >/dev/null
make install >/dev/null

# cleaning
rm -rf "$workdir/vmware-host-modules" >/dev/null

function _bup() {
    echo "Runnign brew upgrade"
    brew update
    brew upgrade
    echo "Running brew cleanup"
    brew cleanup
}


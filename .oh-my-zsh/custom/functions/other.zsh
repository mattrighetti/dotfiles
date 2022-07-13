function _test() {
    echo "Hello! All good here :)"
}
# Sometimes MX2 buttons stop working, this restarts the service
function _rlogi() {
    launchctl stop com.logitech.manager.daemon
    launchctl start com.logitech.manager.daemon
}

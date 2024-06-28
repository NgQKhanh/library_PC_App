import QtQuick 2.15


Item {
    id: common
    property bool _isLogin: false
    property string _userID: ""
    property string _username: ""
    property string libraryName: "Thư viện Đại Học HAKYU"

    property string baseUrl: "http://localhost:3000/app"
    property string loginUrl: "/RFIDlogin"
    property string searchUrl: "/search"

    readonly property bool isLogin: _isLogin
    readonly property string userID: _userID
    readonly property string username: _username

    function login(id, user) {
        _username = user
        _userID = id
        _isLogin = true
    }

    function logout() {
        _username = ""
        _userID = ""
        _isLogin = false
    }
}


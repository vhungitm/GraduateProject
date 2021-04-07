var loginController = {
    init: function () {
        loginController.registerEvent();
    },

    registerEvent: function () {

        $('#btnLogin').off('click').on('click', function () {
            loginController.login();
        });

        $('#frmLogin').validate({
            rules: {
                txtUsername: { required: true },
                txtPassword: { required: true }
            },
            messages: {
                txtUsername: { required: 'Vui lòng nhập tài khoản' },
                txtPassword: { required: 'Vui lòng nhập mật khẩu' }
            }
        });
    },

    /* Login */
    login: function () {
        if ($('#frmLogin').valid()) {
            var username = $('#txtUsername').val();
            var password = $('#txtPassword').val();

            $.ajax({
                url: '/API/User/Login',
                data: {
                    username: username,
                    password: password
                },
                type: 'GET',
                dataType: 'JSON',
                success: function (response) {
                    if (response.status > 0) {
                        bootbox.alert({ message: 'Đăng nhập thành công!' });
                        setTimeout(function () { location = '/' }, 600);
                    } else if (response.status == -1) {
                        bootbox.alert({ message: 'Tài khoản này đã bị khoá! Vui lòng liên hệ với quản trị viên để được mở lại!' });
                    } else {
                        bootbox.alert({ message: 'Đăng nhập không thành công! Sai tên tài khoản hoặc mật khẩu!' });
                    }
                },
                error: function () {
                    bootbox.alert({ message: 'Lỗi hệ thống! Đăng nhập không thành công!' })
                }                

            })
        }
    },
};

loginController.init();
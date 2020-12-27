var config = {
    title: 'sinh viên',
    link: '/Admin/Student/',
    search: '',
    faculty: '',
    branch: '',
    class: '',
    status: 2,
    pageSize: 5,
    pageIndex: 1,
    totalPages: 1,
    isCheckAll: false
};

var controller = {
    init: function () {
        controller.loadData();
        controller.registerEvent();
        controller.loadFilter();
    },

    registerEvent: function () {
        $('#btnSearch').off('click').on('click', function () {
            controller.search();
        });

        $('#btnReset').off('click').on('click', function () {
            controller.loadFilter();

            controller.resetConfig();
            controller.loadData();
        });

        $('#btnCheckAll').off('click').on('click', function () {
            controller.checkAll();
        });

        $('#btnAdd').off('click').on('click', function () {
            controller.resetForm();
            $('#modalUpdateTitle').text("Thêm Mới");
            $('#modalUpdate').modal('show');
        });

        $('#btnDelete').off('click').on('click', function () {
            bootbox.confirm({
                title: "Xóa",
                message: "Xóa những " + config.title + " đã chọn khỏi CSDL?",
                buttons: {
                    cancel: {
                        label: '<i class="fa fa-times"></i> Hủy'
                    },
                    confirm: {
                        label: '<i class="fa fa-check"></i> Đồng ý'
                    }
                },
                callback: function (result) {
                    if (result) {
                        controller.deleteSelection();
                    }
                }
            });
        });

        $('#btnSaveData').off('click').on('click', function () {
            controller.saveData();
        });

        $('#slFaculty').on('change', function () {
            var faculty = $('#slFaculty option:selected').text();
            controller.getBranches(1, "-- Chọn Chuyên Ngành --", faculty);
            $('#slClass').html("<option value='0'>-- Chọn Lớp --</option>");
        });

        $('#slFacultySearch').on('change', function () {
            var faculty = $('#slFacultySearch option:selected').text();
            controller.getBranches(0, "-- Chọn Chuyên Ngành --", faculty);
            $('#slClassSearch').html("<option value='0'>-- Chọn Lớp --</option>");
        });

        $('#slBranch').on('change', function () {
            var className = $('#slBranch option:selected').text();
            controller.getClasses("-- Chọn Lớp --", className);
        });

        $('#slBranchSearch').on('change', function () {
            var className = $('#slBranchSearch option:selected').text();
            controller.getClasses(0, "-- Chọn Lớp --", className);
        });

        $('#ckbChangeStatus').off('click').on('click', function () {
            var label = $('#ckbStatus').prop('checked') ? 'Kích hoạt' : 'Khóa';
            $('#ckbChangeStatus label').text(label);
        });

        $('.checkbox-item').off('click').on('click', function () {
            controller.selectItem();
        });

        $('.button-update').off('click').on('click', function () {
            var id = $(this).data('id');

            controller.loadDetail(id);
            $('#modalUpdateTitle').text("Cập Nhật Thông Tin");
            $('#modalUpdate').modal('show');

        });

        $('.button-delete').off('click').on('click', function () {
            var id = $(this).data('id');

            bootbox.confirm({
                title: "Xóa",
                message: "Xóa " + config.title + " này khỏi CSDL?",
                buttons: {
                    cancel: {
                        label: '<i class="fa fa-times"></i> Hủy'
                    },
                    confirm: {
                        label: '<i class="fa fa-check"></i> Đồng ý'
                    }
                },
                callback: function (result) {
                    if (result) {
                        controller.delete(id);
                    }
                }
            });
        });

        $('.checkbox-status').off('click').on('click', function (e) {
            e.preventDefault();
            var btn = $(this);

            bootbox.confirm({
                title: "Thay Đổi Trạng Thái Kích Hoạt",
                message: "Thay đổi trạng thái kích hoạt tài khoản của " + config.title + " này?",

                buttons: {
                    cancel: {
                        label: '<i class="fa fa-times"></i> Không'
                    },
                    confirm: {
                        label: '<i class="fa fa-check"></i> Đồng ý'
                    }
                },

                callback: function (result) {
                    if (result) {
                        controller.changeStatus(btn);
                    }
                }
            });
        });
    },

    loadFilter: function () {
        $('#filter').html($("#filterContent").html());
        controller.getFaculties(0, '');
    },

    filterByStatus: function (status) {
        config.status = status;
        controller.loadData();
    },

    resetConfig: function () {
        config.search = '';
        config.faculty = '';
        config.branch = '';
        config.class = '';
        config.status = 2;
        pageSize = 5;
        pageIndex = 1;
        totalPages = 1;
        isCheckAll = false;
    },

    search: function () {
        controller.resetConfig();

        var txtSearch = $('#txtSearch');
        var slFaculty = $('#slFacultySearch option:selected');
        var slBranch = $('#slBranchSearch option:selected');
        var slClass = $('#slClassSearch option:selected');
        var slStatus = $('#slStatusSearch option:selected');

        config.search = txtSearch.val();
        config.faculty = slFaculty.val() > 0 ? slFaculty.text() : '';
        config.branch = slBranch.val() > 0 ? slBranch.text() : '';
        config.class = slClass.val() > 0 ? slClass.text() : '';
        config.status = slStatus.val();

        controller.loadData();
    },

    checkAll: function () {
        $('.checkbox-item').prop('checked', !config.isCheckAll);

        config.isCheckAll = !config.isCheckAll;

        $('#btnCheckAll').removeClass().addClass(
            config.isCheckAll
                ? 'btn btn-sm btn-danger shadow-sm'
                : 'btn btn-sm btn-primary shadow-sm'
        );

        $('#btnCheckAll').html(
            config.isCheckAll
                ? "<i class='fas fa-times fa-sm text-white-50'></i> Bỏ Chọn Tất Cả"
                : "<i class='fas fa-check fa-sm text-white-50'></i> Chọn Tất Cả"
        );

        $('#btnDelete').removeClass().addClass(config.isCheckAll ? 'btn btn-sm btn-danger shadow-sm' : 'd-none');
    },

    countCheckedItem: function () {
        var list = $('.checkbox-item');
        var quantity = 0;

        for (var i = 0; i < list.length; i++) {
            if (list[i].checked) quantity++;
        }

        return quantity;
    },

    selectItem: function () {
        $('#btnDelete').removeClass().addClass(controller.countCheckedItem() > 0 ? 'btn btn-sm btn-danger shadow-sm' : 'd-none');
    },

    deleteSelection: function () {
        var id = [];

        $('.checkbox-item:checked').each(function (i) {
            id[i] = $(this).val();
        });

        $.ajax({
            url: config.link + 'Delete',
            data: { id: id },
            type: 'POST',
            dataType: 'json',

            success: function (response) {
                if (response.status) {
                    var result = response.result;
                    var message = '';

                    for (var i = result.length - 1; i >= 0; i--) {
                        if (result[i])
                            message += 'Xóa ' + config.title + ' #' + id[i] + ' thành công!</br>';
                        else
                            message += 'Xóa ' + config.title + ' #' + id[i] + ' không thành công!</br>';
                    }

                    bootbox.alert({ message: message });
                    controller.loadData();
                } else {
                    bootbox.alert({ message: 'Lỗi hệ thống! Xóa ' + config.title + ' không thành công!' });
                }
            },

            error: function () {
                bootbox.alert({ message: 'Lỗi hệ thống! Xóa ' + config.title + ' không thành công!' });
            }
        });
    },

    resetForm: function () {
        $("#frmUpdate").trigger('reset');
        $('#ckbChangeStatus label').text('Kích hoạt');
        controller.getFaculties(1, "-- Chọn Khoa --");
    },

    loadDetail: function (id) {
        $.ajax({
            url: config.link + 'LoadDetail',
            data: { id: id },
            type: 'GET',
            dataType: 'json',

            success: function (response) {
                if (response.status) {
                    var data = response.data;

                    controller.getFaculties(1, data.Faculty);
                    controller.getBranches(1, data.Branch, data.Faculty);
                    controller.getClasses(1, data.Class, data.Branch);

                    $('#nbrId').val(data.Id);
                    $('#txtUsername').val(data.Username);
                    $('#txtPassword').val(data.Password);
                    $('#txtAvatar').val(data.Avatar);
                    $('#imgAvatar').attr("src", data.Avatar);
                    $('#txtFullName').val(data.FullName);
                    $('#slGender').val(data.Gender);
                    $('#dtBirthday').val(data.Birthday);
                    $('#txtAddress').val(data.Address);
                    $('#txtPhone').val(data.Phone);
                    $('#txtEmail').val(data.Email);
                    $('#ckbStatus').prop('checked', data.Status);
                    $('#ckbChangeStatus label').text(data.Status ? 'Kích hoạt' : 'Khóa');
                }
            }

        });
    },

    saveData: function () {
        var id = $('#nbrId').val();
        var username = $('#txtUsername').val();
        var password = $('#txtPassword').val();
        var avatar = $('#txtAvatar').val();
        var fullName = $('#txtFullName').val();
        var gender = $('#slGender option:selected').text();
        var birthday = $('#dtBirthday').val();
        var address = $('#txtAddress').val();
        var phone = $('#txtPhone').val();
        var email = $('#txtEmail').val();
        var classId = $('#slClass option:selected').val();
        var status = $('#ckbStatus').prop('checked');

        var model = {
            Id: id,
            Username: username,
            Password: password,
            Avatar: avatar,
            FullName: fullName,
            Gender: gender,
            Birthday: birthday,
            Address: address,
            Phone: phone,
            Email: email,
            ClassId: classId,
            Status: status
        };

        $.ajax({
            url: config.link + 'SaveData',
            data: { model: model },
            type: 'POST',
            dataType: 'json',

            success: function (response) {
                if (response.status) {
                    $("#modalUpdate").modal('hide');

                    controller.resetConfig();
                    bootbox.alert({ message: id == 0 ? "Thêm mới " + config.title + " thành công!" : "Cập nhật thông tin " + config.title + " thành công!" });

                    controller.loadData();
                } else {
                    bootbox.alert({ message: id == 0 ? "Thêm mới " + config.title + " không thành công!" : "Cập nhật thông tin " + config.title + " không thành công!" });
                }
            },

            error: function () {
                bootbox.alert({ message: id == 0 ? "Thêm mới " + config.title + " không thành công!" : "Cập nhật thông tin " + config.title + " không thành công!" });
            }
        })
    },

    delete: function (id) {
        $.ajax({
            url: config.link + 'Delete',
            data: { id: id },
            type: 'POST',
            dataType: 'json',

            success: function (response) {
                if (response.status) {
                    controller.resetConfig();
                    controller.loadData();
                    $('#modalUpdate').modal('hide');
                    bootbox.alert({ message: "Xóa " + config.title + " thành công!" });
                } else {
                    bootbox.alert({ message: "Xóa " + config.title + " không thành công!" });
                }
            },

            error: function () {
                bootbox.alert({ message: "Lỗi hệ thống! Xóa " + config.title + " không thành công!" });
            }
        });
    },

    loadData: function () {
        $.ajax({
            url: config.link + 'LoadData',
            data: {
                search: config.search,
                faculty: config.faculty,
                branch: config.branch,
                className: config.class,
                status: config.status,
                page: config.pageIndex,
                pageSize: config.pageSize
            },
            type: 'GET',
            dataType: 'json',

            success: function (response) {
                if (response.status && response.totalRow > 0) {
                    var totalPages = Math.ceil(response.totalRow / config.pageSize);

                    if (config.pageIndex > totalPages) {
                        config.pageIndex = totalPages;
                        controller.loadData();
                    }

                    var data = response.data;
                    var html = '';
                    var template = $('#template').html();

                    html += $('#tblHeader').html();

                    $.each(data, function (i, item) {
                        html += Mustache.render(template, {
                            Id: item.Id,
                            Username: item.Username,
                            Avatar: item.Avatar,
                            FullName: item.FullName,
                            Gender: item.Gender,
                            Birthday: item.Birthday,
                            Address: item.Address,
                            Phone: item.Phone,
                            Email: item.Email,
                            Class: item.Class,
                            Faculty: item.Faculty,
                            Branch: item.Branch,
                            TrainingSystem: item.TrainingSystem,
                            CollegeYear: item.CollegeYear,
                            Status: item.Status ? 'checked' : '',
                            StatusTitle: item.Status ? 'Kích hoạt' : 'Khóa'
                        });
                    });

                    $('#tblData').html(html);
                    controller.registerEvent();

                    $('#btnCheckAll').show();
                    $('#btnDelete').removeClass().addClass('d-none');
                    controller.resetPage(totalPages);
                    controller.paging(totalPages);

                    return;
                }

                $('#btnCheckAll').hide();
                $('#btnDelete').removeClass().addClass('d-none');
                controller.resetPage(0);
                $('#tblData').html("<div class='alert alert-danger' style='margin-bottom: -15px'>Không có dữ liệu<div>");
            },

            error: function () {
                $('#btnCheckAll').hide();
                $('#btnDelete').removeClass().addClass('d-none');
                controller.resetPage(0);
                $('#tblData').html("<div class='alert alert-danger' style='margin-bottom: -15px'>Không có dữ liệu<div>");
            }
        });
    },

    resetPage: function (totalPages) {
        if (totalPages != config.totalPages) {
            $('#pagination').removeData('twbs-pagination');
            $('#pagination').html('');
            config.totalPages = totalPages;
        }
    },

    paging: function (totalPages) {
        if (totalPages > 1) {
            $('#pagination').twbsPagination({
                totalPages: config.totalPages,
                first: 'Đầu',
                last: 'Cuối',
                prev: 'Trước',
                next: 'Tiếp',
                startPage: config.pageIndex,

                onPageClick: function (event, page) {
                    config.pageIndex = page;
                    controller.loadData();
                }
            });
        }
    },

    changeStatus: function (btn) {
        var id = btn.data('id');

        $.ajax({
            url: config.link + 'ChangeStatus',
            data: { id: id },
            type: 'POST',
            dataType: 'json',

            success: function (response) {
                if (response.status) {
                    bootbox.alert({ message: 'Thay đổi trạng thái kích hoạt tài khoản của ' + config.title + ' thành công!' });

                    controller.loadData();
                } else {
                    bootbox.alert({ message: 'Thay đổi trạng thái kích hoạt tài khoản của ' + config.title + ' không thành công!' });
                }
            },

            error: function () {
                bootbox.alert({ message: 'Lỗi hệ thống! Thay đổi trạng thái kích hoạt tài khoản của ' + config.title + ' không thành công!' });
            }
        })
    },

    getFaculties: function (type, name) {
        $.ajax({
            url: '/Admin/Faculty/GetFaculties',
            type: 'GET',
            dataType: 'json',

            success: function (response) {
                if (response.status == true) {
                    var data = response.data;
                    var html = "<option value='0'>-- Chọn Khoa --</option>";

                    $.each(data, function (i, item) {
                        html += "<option value='" + item.Id + "' " + (name == item.Name ? "selected" : "") + ">" + item.Name + "</option>";
                    });

                    $(type == 0 ? '#slFacultySearch' : '#slFaculty').html(html);
                } else {
                    bootbox.alert({ message: "Lỗi hệ thống! Lấy danh sách khoa không thành công!" });
                }
            }
        });
    },

    getBranches: function (type, name, faculty) {
        $.ajax({
            url: '/Admin/Branch/GetBranches',
            data: { faculty: faculty },
            type: 'GET',
            dataType: 'json',

            success: function (response) {
                if (response.status == true) {
                    var data = response.data;
                    var html = "<option value='0'>-- Chọn Chuyên Ngành --</option>";

                    $.each(data, function (i, item) {
                        html += "<option value='" + item.Id + "' " + (name == item.Name ? "selected" : "") + ">" + item.Name + "</option>";
                    });

                    $(type == 0 ? '#slBranchSearch' : '#slBranch').html(html);
                } else {
                    bootbox.alert({ message: "Lỗi hệ thống! Lấy danh sách chuyên ngành không thành công!" });
                }
            }
        });
    },

    getClasses: function (type, name, branch) {
        $.ajax({
            url: '/Admin/Class/GetClasses',
            data: { branch: branch },
            type: 'GET',
            dataType: 'json',

            success: function (response) {
                if (response.status == true) {
                    var data = response.data;
                    var html = "<option value='0'>-- Chọn Lớp --</option>";

                    $.each(data, function (i, item) {
                        html += "<option value='" + item.Id + "' " + (name == item.Name ? "selected" : "") + ">" + item.Name + "</option>";
                    });

                    $(type == 0 ? '#slClassSearch' : '#slClass').html(html);
                } else {
                    bootbox.alert({ message: "Lỗi hệ thống! Lấy danh sách lớp không thành công!" });
                }
            }
        });
    }
}

controller.init();
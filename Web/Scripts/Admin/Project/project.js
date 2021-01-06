var config = {
    title: 'đề tài',
    link: '/API/Project/',
    name: '',
    student: '',
    lecturer: '',
    projectTypeId: '',
    year: '',
    classId: '',
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

        $('#btnAddProject').off('click').on('click', function () {
            var content = $('#updateProjectContent').html();

            controller.showModal('Thêm Mới Đề Tài', content);
        });

        $('#btnDeleteProject').off('click').on('click', function () {
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

        $('#btnShowPassword').off('click').on('click', function (e) {
            e.preventDefault();

            var isShow = ($('#txtPassword').attr('type') == 'text' ? true : false);
            $(this).attr('class', isShow ? 'btn btn-primary btn-icon-split' : 'btn btn-danger btn-icon-split');
            $('#btnShowPassword i').attr('class', isShow ? 'fas fa-eye' : 'fas fa-eye-slash');
            $('#btnShowPassword .text').text(isShow ? 'Hiển Thị' : 'Ẩn');
            $('#txtPassword').attr('type', isShow ? 'password' : 'text');
        });

        $('#btnSaveData').off('click').on('click', function () {
            controller.saveData();
        });

        $('#txtStudentId').off('change').on('change', function () {
            controller.loadStudent($(this).val());
        });

        $('.checkbox-item').off('click').on('click', function () {
            controller.selectItem();
        });

        $('.button-update-project').off('click').on('click', function () {
            var id = $(this).data('id');
            var content = $('#updateProjectContent').html();
            controller.showModal('Cập Nhật Thông Tin Đề Tài', content);
            controller.loadDetail(id);

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

    showModal: function(title, content){
        $('#modalTitle').text(title);
        $('#modalContent').html(content);
        $('#modal').modal('show');
        controller.registerEvent();
    },

    loadFilter: function () {
        $('#filter').html($("#filterContent").html());
    },

    resetConfig: function () {
        config.name = '';
        config.student = '';
        config.lecturer = '';
        config.year = 0;
        config.projectTypeId = 0;
        config.year = 0;
        config.isCheckAll = false;
    },

    search: function () {
        controller.resetConfig();

        config.name = $('#txtNameSearch').val();
        config.student = $('#txtStudentSearch').val();
        config.lecturer = $('#txtLecturerSearch').val();
        config.year = $('#slYearSearch option:selected').val();
        config.classId = $('#slClassIdSearch option:selected').val();

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

    loadDetail: function (id) {
        $.ajax({
            url: config.link + 'GetProject',
            data: { id: id },
            type: 'GET',
            dataType: 'json',
            success: function (response) {
                if (response.status) {
                    var data = response.data;

                    $('#txtProjectName').val(data.Name);
                    $('#txtStudentId').addClass('valid').val(data.StudentId);
                    $('#txtStudentName').removeAttr('style').text(data.StudentName);
                    $('#txtLecturerId').addClass('valid').val(data.LecturerId);
                    $('#txtLecturerName').removeAttr('style').text(data.LecturerName);

                    var startDateTime = data.StartDate.split(' ');
                    var startDate = startDateTime[0].split('/');
                    var startTime = startDateTime[1].split(':');

                    $('#dtProjectStartDate').val(startDate[2] + '-' + startDate[1] + '-' + startDate[0]);
                    $('#slProjectStartHour option')[parseInt(startTime[0])].selected = true;
                    $('#slProjectStartMinute option')[parseInt(startTime[1])].selected = true;

                    var endDateTime = data.EndDate.split(' ');
                    var endDate = endDateTime[0].split('/');
                    var endTime = endDateTime[1].split(':');

                    $('#dtProjectEndDate').val(endDate[2] + '-' + endDate[1] + '-' + endDate[0]);
                    $('#slProjectEndHour option')[parseInt(endTime[0])].selected = true;
                    $('#slProjectEndMinute option')[parseInt(endTime[1])].selected = true;
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
                    controller.loadFilter();
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
            url: config.link + 'GetProjects',
            data: {
                id: config.id,
                name: config.name,
                student: config.student,
                lecturer: config.lecturer,
                projectTypeId: config.projectTypeId,
                year: config.year,
                branchId: branchId,
                classId: config.classId,
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
                            Name: item.Name,
                            Type: item.Type,
                            StudentName: item.StudentName,
                            LecturerName: item.LecturerName,
                            CreatedDate: item.CreatedDate,
                            StartDate: item.StartDate,
                            EndDate: item.EndDate,
                            AssemblyName: item.AssemblyName != null ? 'Tên hội đồng: ' + item.AssemblyName + '<br/>' : 'Chưa lập hội đồng',
                            AssemblyCreatedDate: item.AssemblyName != null ? 'Ngày lập hội đồng: ' + item.AssemblyCreatedDate : '',
                            AssemblyView: item.AssemblyName != null ? "<button id='btnViewAssembly' class='ml-auto btn btn-primary btn-circle btn-sm' title='Xem bài nộp'><i class='fas fa-eye'></i></button>" : "",
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
    },

    loadStudent: function (id) {
        $.ajax({
            url: "/API/Student/GetStudent",
            data: { id: id },
            type: 'GET',
            dataType: 'json',
            success: function (response) {
                var data = response.data;

                if (data != null) {
                    $('#txtStudentId').attr('class', 'form-control valid');
                    $('#txtStudentName').removeAttr('style').attr('class', 'valid').attr('data-name', data.FullName).text(data.FullName);
                }
                else {
                    $('#txtStudentId').attr('class', 'form-control error');
                    $('#txtStudentName').removeAttr('style').attr('class', 'error').attr('data-name', '').text('Không tìm thấy sinh viên');
                }
            },
            error: function () {
                $('#txtStudentId').attr('class', 'form-control error');
                $('#txtStudentName').removeAttr('style').attr('class', 'error').attr('data-name', '').text('Không tìm thấy sinh viên');
            }
        });
    }
}

controller.init();
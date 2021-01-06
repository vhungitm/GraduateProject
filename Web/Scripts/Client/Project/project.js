var config = {
    title: 'đề tài',
    link: '/API/Project/',
    name: '',
    student: '',
    year: 0,
    classId: '',
    pageIndex: 1,
    pageSize: 1,
    totalPages: 1
};

var controller = {

    init: function () {
        controller.loadData();
        controller.registerEvent();
        controller.loadFilter();
    },

    registerEvent: function () {
        $('#frmAddProject').validate({
            rules: {
                txtName: { required: true },
                slTypeId: { required: true },
                dtStartDate: { required: true },
                slStartHour: { required: true },
                slStartMinute: { required: true },
                slEndDate: { required: true },
                slEndHour: { required: true },
                slEndMinute: { required: true },
            },
            messages: {
                txtName: { required: 'Vui lòng nhập tên đề tài!' },
                slTypeId: { required: 'Vui lòng chọn loại đề tài!' }
            }
        });

        $('#btnSearch').off('click').on('click', function (e) {
            e.preventDefault();
            controller.search();
        });

        $('#btnReset').off('click').on('click', function () {
            controller.loadFilter();

            controller.resetConfig();
            controller.loadData();
        });

        $('#btnAddProject').off('click').on('click', function () {
            controller.loadModal();
            $('#modalAddProject').modal('show');
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

        $('#btnSaveProject').off('click').on('click', function () {
            controller.addProject();
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
                },
            });
        });

        $('#txtStudentId').off('change').on('change', function () {
            controller.loadStudent($(this).val());
        });
    },

    loadFilter: function () {
        $('#projectFilter').html($("#projectFilterContent").html());
    },

    loadModal: function () {
        var modal = $('#modalAddProjectContent').html();
        $('#modal').html(modal);
        controller.registerEvent();
    },

    resetConfig: function () {
        config.name = '';
        config.student = '';
        config.year = 0;
        config.classId = '';
    },

    search: function () {
        controller.resetConfig();

        config.name = $('#txtNameSearch').val();
        config.student = $('#txtStudentSearch').val();
        config.year = $('#slYearSearch option:selected').val();
        config.classId = $('#slClassIdSearch option:selected').val();

        controller.loadData();
    },

    addProject: function () {
        var studentId = $('#txtStudentId').val();
        controller.loadStudent(studentId);
        var txtStudentName = $('#txtStudentName').text();

        if ($('#frmAddProject').valid() && txtStudentName != 'Không tìm thấy sinh viên') {
            var name = $('#txtName').val();
            var typeId = $('#slTypeId option:selected').val();
            var studentId = $('#txtStudentId').val();
            var startDate = $('#dtStartDate').val() + ' ' + $('#slStartHour option:selected').val() + ':' + $('#slStartMinute option:selected').val();
            var endDate = $('#dtEndDate').val() + ' ' + $('#slEndHour option:selected').val() + ':' + $('#slEndMinute option:selected').val();

            var model = {
                Name: name,
                TypeId: typeId,
                StudentId: studentId,
                LecturerId: lecturerId,
                StartDate: startDate,
                EndDate: endDate
            };

            $.ajax({
                url: config.link + 'Insert',
                data: { model: model },
                type: 'POST',
                dataType: 'json',

                success: function (response) {
                    if (response.status) {
                        $("#modalAddProject").modal('hide');

                        controller.resetConfig();
                        controller.loadFilter();
                        bootbox.alert({ message: "Thêm mới " + config.title + " thành công!" });

                        controller.loadData();
                    } else {
                        bootbox.alert({ message: "Thêm mới " + config.title + " không thành công!" });
                    }
                },

                error: function () {
                    bootbox.alert({ message: "Thêm mới " + config.title + " không thành công!" });
                }
            });
        };
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
                name: config.name,
                student: config.student,
                lecturer: lecturerId,
                year: config.year,
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
                    var html = "<div class='row row-cols-1 row-cols-md-4 g-3'>";
                    var template = $('#projectItem').html();

                    $.each(data, function (i, item) {
                        html += Mustache.render(template, {
                            Id: item.Id,
                            Name: item.Name,
                            Student: item.Student
                        });
                    });

                    $('#projectData').html(html + "</div>");
                    controller.registerEvent();

                    controller.resetPage(totalPages);
                    controller.paging(totalPages);

                    return;
                }

                controller.resetPage(0);
                $('#projectData').html("<div class='alert alert-danger' style='margin-bottom: -15px'>Không có dữ liệu<div>");
            },

            error: function () {
                controller.resetPage(0);
                $('#projectData').html("<div class='alert alert-danger' style='margin-bottom: -15px'>Không có dữ liệu<div>");
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
                else
                {
                    $('#txtStudentId').attr('class', 'form-control error');
                    $('#txtStudentName').removeAttr('style').attr('class', 'error').attr('data-name','').text('Không tìm thấy sinh viên');
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
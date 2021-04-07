var config = {
    name: '',
    student: '',
    year: 0,
    classId: '',
    projectTypeId: 0,
    pageIndex: 1,
    pageSize: 5,
    totalPages: 1
};

var projectController = {

    init: function () {
        projectController.loadFilter();
        projectController.loadProjects();
        projectController.registerEvent();
        
    },

    registerEvent: function () {
        /* Export excel */
        $('#btnExportExcel').off('click').on('click', function () {
            link = "/Project/ExportExcel?" + "student=" + config.student + "&lecturer=" + lecturerId;
            link += "&projectTypeId=" + config.projectTypeId + "&year=" + config.year + "&classId=" + config.classId + "&pointStatus=2";

            window.location = link;
        });

        /* Filter */
        $('#btnSearch').off('click').on('click', function (e) {
            e.preventDefault();
            projectController.search();
        });

        $('#btnReset').off('click').on('click', function () {
            projectController.loadFilter();

            projectController.resetConfig();
            projectController.loadProjects();
        });

        /* Add / Update Project */
        $('#btnAddProject').off('click').on('click', function () {
            projectController.showModal('Thêm Mới Đề Tài', $('#modalUpdateProject').html());
            projectController.loadProjectType('', $('#slProjectTypeId'));
        });

        $('.button-update-project').off('click').on('click', function () {
            var id = $(this).data('id');

            projectController.showModal('Cập Nhật Thông Tin Đề Tài', $('#modalUpdateProject').html());
            projectController.loadProject(id);
        });

        $('#btnSaveProject').off('click').on('click', function () {
            projectController.saveProject();
        });

        $('#frmUpdateProject').validate({
            rules: {
                txtProjectName: { required: true },
                slProjectTypeId: { required: true },
                dtProjectStartDate: { required: true },
                slProjectStartHour: { required: true },
                slProjectStartMinute: { required: true },
                slProjectEndDate: { required: true },
                slProjectEndHour: { required: true },
                slProjectEndMinute: { required: true },
            },
            messages: {
                txtProjectName: { required: 'Vui lòng nhập tên đề tài!' },
                slProjectTypeId: { required: 'Vui lòng chọn loại đề tài!' }
            }
        });

        $('#txtStudentId').off('change').on('change', function () {
            projectController.loadStudent($(this), $('#txtStudentName'));
        });

        /* Delete Project */
        $('.button-delete-project').off('click').on('click', function () {
            var id = $(this).data('id');

            bootbox.confirm({
                title: "Xóa Đề Tài",
                message: "Xóa đề tài này khỏi hệ thống?",
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
                        projectController.deleteProject(id);
                    }
                }
            });
        });
    },
    
    /* Show Modal */
    showModal: function (title, content, size) {
        var cssForSize;

        if (size == 'large')
            cssForSize = 'modal-dialog modal-lg';
        else
            cssForSize = 'modal-dialog';

        $('#modal div').eq(0).attr('class', cssForSize);

        $('#modalTitle').text(title);
        $('#modalContent').html(content);
        $('#modal').modal('show');
        projectController.registerEvent();
    },

    /* Filter */
    loadFilter: function () {
        $('#projectFilter').html($("#projectFilterContent").html());

        projectController.loadProjectType('', $('#slProjectTypeIdSearch'));
        projectController.loadClass();
    },

    search: function () {
        projectController.resetConfig();

        config.name = $('#txtNameSearch').val();
        config.student = $('#txtStudentSearch').val();
        config.lecturer = $('#txtLecturerSearch').val();
        config.projectTypeId = $('#slProjectTypeIdSearch option:selected').val();
        config.year = $('#slYearSearch option:selected').val();
        config.classId = $('#slClassIdSearch option:selected').val();

        projectController.loadProjects();
    },

    resetConfig: function () {
        config.name = '';
        config.student = '';
        config.projectTypeId = 0;
        config.year = 0;
        config.classId = '';

        projectController.loadClass();
    },

    loadClass: function () {
        $.ajax({
            url: '/Class/Get',
            data: {
                branchId: branchId
            },
            type: 'GET',
            dataType: 'json',
            success: function (response) {
                if (response.status) {
                    var data = response.data;
                    var html = '';

                    html += "<option value=''>-- Chọn lớp --</option>";

                    $.each(data, function (i, item) {
                        var selected = (config.classId == item.Id) ? 'selected' : '';

                        html += "<option value='" + item.Id + "' " + selected + ">" + item.Id + "</option>";
                    });

                    $('#slClassIdSearch').html(html);
                }
            }
        });
    },

    /* Load Project */
    loadProjects: function () {
        $.ajax({
            url: '/API/Project/Get',
            data: {
                name: config.name,
                student: config.student,
                lecturer: lecturerId,
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
                        projectController.loadProjects();
                    }

                    var data = response.data;
                    var html = '';
                    var template = $('#projectItem').html();

                    html += $('#tblProjectHeader').html();

                    $.each(data, function (i, item) {
                        html += Mustache.render(template, {
                            Id: item.Id,
                            Name: item.Name,
                            TypeName: item.TypeName,
                            StudentId: item.StudentId,
                            StudentName: item.StudentName,
                            ClassId: item.ClassId,
                            LecturerId: item.LecturerId,
                            LecturerName: item.LecturerName,
                            CreatedDate: item.CreatedDate,
                            StartDate: item.StartDate,
                            EndDate: item.EndDate,
                            Point: item.Point == null ? 'Chưa chấm' : (Math.round(item.Point * 10) / 10),
                        });
                    });

                    $('#tblProject').html(html);
                    projectController.registerEvent();

                    projectController.resetPage(totalPages);
                    projectController.paging(totalPages);
                    $('#btnExportExcel').removeAttr('style');

                    return;
                }

                projectController.resetPage(0);
                $('#tblProject').html("<div class='alert alert-danger' style='margin-bottom: 0px'>Không có dữ liệu<div>");
                $('#btnExportExcel').attr('style', 'display: none');
            },

            error: function () {
                projectController.resetPage(0);
                $('#tblData').html("<div class='alert alert-danger' style='margin-bottom: 0px'>Không có dữ liệu<div>");
            }
        });
    },

    loadProject: function (id) {
        $.ajax({
            url: '/API/Project/Get',
            data: { id: id },
            type: 'GET',
            dataType: 'json',
            success: function (response) {
                if (response.status) {
                    var data = response.data[0];

                    $('#frmUpdateProject input').attr('class', 'form-control valid');
                    $('#frmUpdateProject select').attr('class', 'form-control valid');

                    $('#nbrProjectId').val(data.Id);
                    $('#txtProjectName').val(data.Name);
                    projectController.loadProjectType(data.TypeId, $('#slProjectTypeId'));
                    $('#txtStudentId').addClass('valid').val(data.StudentId);
                    $('#txtStudentName').removeAttr('style').text(data.StudentName);

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

    /* Add / Update Project */
    saveProject: function () {
        projectController.loadStudent($('#txtStudentId'), $('#txtStudentName'));
        var studentName = $('#txtStudentName').text();

        if ($('#frmUpdateProject').valid() && studentName != 'Không tìm thấy sinh viên!') {
            var id = $('#nbrProjectId').val();
            var name = $('#txtProjectName').val();
            var typeId = $('#slProjectTypeId option:selected').val();
            var studentId = $('#txtStudentId').val();
            var startDate = $('#dtProjectStartDate').val() + ' ' + $('#slProjectStartHour option:selected').val() + ':' + $('#slProjectStartMinute option:selected').val();
            var endDate = $('#dtProjectEndDate').val() + ' ' + $('#slProjectEndHour option:selected').val() + ':' + $('#slProjectEndMinute option:selected').val();

            var model = {
                Id: id,
                Name: name,
                TypeId: typeId,
                StudentId: studentId,
                LecturerId: lecturerId,
                StartDate: startDate,
                EndDate: endDate
            };

            $.ajax({
                url: '/API/Project/' + (id == 0 ? 'Insert' : 'Update'),
                data: { model: model },
                type: 'POST',
                dataType: 'json',
                success: function (response) {
                    if (response.status == 1) {
                        projectController.resetConfig();
                        projectController.loadProjects();
                        $('#modal').modal('hide');

                        bootbox.alert({ message: (id == 0 ? 'Thêm mới ' : 'Cập nhật thông tin ') + 'đề tài thành công!' });
                    } else if (response.status == -1) {
                        bootbox.alert({ message: (id == 0 ? 'Thêm mới ' : 'Cập nhật thông tin ') + 'đề tài không thành công! Thời gian tối thiểu để thực hiện đề tài là 5 tháng!' });
                    } else if(response.status == -2) {
                        bootbox.alert({ message: 'Thêm mới đề tài không thành công! Sinh viên này đã được đăng ký đề tài trước đó!' });
                    }
                    else {
                        bootbox.alert({ message: (id == 0 ? 'Thêm mới ' : 'Cập nhật thông tin ') + 'đề tài không thành công!' });
                    }
                }
            });
        }
    },

    loadProjectType: function (id, result) {
        $.ajax({
            url: '/ProjectType/Get',
            data: {},
            type: 'GET',
            dataType: 'json',
            success: function (response) {
                if (response.status) {
                    var data = response.data;
                    var html = '';

                    html += "<option value=''>-- Chọn loại đề tài --</option>";

                    $.each(data, function (i, item) {
                        var selected = (id == item.Id) ? 'selected' : '';

                        html += "<option value='" + item.Id + "' " + selected + ">" + item.Name + "</option>";
                    });

                    result.html(html);
                }
            }
        });
    },

    loadStudent: function (input, result) {
        var id = $.trim(input.val()) == '' ? 'NOID' : $.trim(input.val());

        $.ajax({
            url: "/API/Student/Get",
            data: {
                id: id,
                branchId: branchId
            },
            type: 'GET',
            dataType: 'json',
            success: function (response) {
                var data = (response.data)[0];

                if (data != null) {
                    input.attr('class', 'form-control valid');
                    result.removeAttr('style').attr('class', 'valid').attr('data-name', data.FullName).text(data.FullName);
                }
                else {
                    input.attr('class', 'form-control error');
                    result.removeAttr('style').attr('class', 'error').attr('data-name', '').text('Không tìm thấy sinh viên!');
                }
            },
            error: function () {
                input.attr('class', 'form-control error');
                result.removeAttr('style').attr('class', 'error').attr('data-name', '').text('Không tìm thấy sinh viên!');
            }
        });
    },

    /* Delete Project */
    deleteProject: function (id) {
        $.ajax({
            url: '/API/Project/Delete',
            data: { id: id },
            type: 'POST',
            dataType: 'json',

            success: function (response) {
                if (response.status) {
                    projectController.resetConfig();
                    projectController.loadProjects();
                    $('#modalUpdate').modal('hide');
                    bootbox.alert({ message: "Xóa đề tài thành công!" });
                } else {
                    bootbox.alert({ message: "Xóa đề tài không thành công!" });
                }
            },

            error: function () {
                bootbox.alert({ message: "Lỗi hệ thống! Xóa đề tài không thành công!" });
            }
        });
    },

    /* Pagination */
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
                    projectController.loadData();
                }
            });
        }
    },  
}

projectController.init();
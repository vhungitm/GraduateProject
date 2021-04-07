var config = {
    name: '',
    student: '',
    lecturer: '',
    projectTypeId: '',
    year: '',
    classId: '',
    pointStatus: 2,
    pageSize: 5,
    pageIndex: 1,
    totalPages: 1
};

var controller = {
    init: function () {
        controller.loadProjects();
        controller.loadFilter();
        controller.registerEvent(); 
    },

    registerEvent: function () {
        /* Export excel */
        $('#btnExportExcel').off('click').on('click', function () {
            link = "/Admin/Project/ExportExcel?id=" + config.id + "&student=" + config.student + "&lecturer=" + config.lecturer;
            link += "&projectTypeId=" + config.projectTypeId + "&year=" + config.year + "&classId=" + config.classId + "&pointStatus=" + config.pointStatus;

            window.location = link;
        });

        /* Select Project Item */
        $('.checkbox-item').off('click').on('click', function () {
            controller.selectProjectItem();
        });

        $('#btnCheckAllProject').off('click').on('click', function () {
            controller.checkAllProject();
        });

        /* Filter */
        $('#btnSearch').off('click').on('click', function () {
            controller.search();
        });

        $('#btnReset').off('click').on('click', function () {
            controller.loadFilter();

            controller.resetConfig();
            controller.loadProjects();
        });
        
        /* Add / Update Project */
        $('.button-update-project').off('click').on('click', function () {
            var id = $(this).data('id');
            var content = $('#modalUpdateProject').html();

            controller.showModal('Cập Nhật Thông Tin Đề Tài', content);
            controller.loadProject(id);

            $('#txtLecturerId').attr('readonly', 'readonly');
            $('#frmUpdateProject input').attr('class', 'form-control valid');
            $('#frmUpdateProject select').attr('class', 'form-control valid');
        });

        $('#btnAddProject').off('click').on('click', function () {
            var content = $('#modalUpdateProject').html();

            controller.showModal('Thêm Mới Đề Tài', content);

            controller.loadProjectType(0, $('#slProjectTypeId'));
            $('#txtLecturerId').removeAttr('readonly');
        });

        $('#btnSaveProject').off('click').on('click', function () {
            controller.saveProject();
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
            controller.loadStudent($(this), $('#txtStudentName'));
        });

        $('#txtLecturerId').off('change').on('change', function () {
            controller.loadLecturer($(this), $('#txtLecturerName'));
        });

        /* Delete Project */
        $('#btnDeleteProject').off('click').on('click', function () {
            bootbox.confirm({
                title: "Xóa Đề Tài",
                message: "Xóa những đề tài đã chọn khỏi hệ thống?",
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
                        controller.deleteProjectSelection();
                    }
                }
            });
        });

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
                        controller.deleteProject(id);
                    }
                }
            });
        });

        /* View Assembly */
        $('.button-view-assembly').off('click').on('click', function () {
            var id = $(this).data('id');

            $('#modalViewAssembly').modal('show');
            controller.loadAssembly(id);

        });

        /* Add / Update Assembly */
        $('.button-add-assembly').off('click').on('click', function(){
            var content = $('#modalAddAssembly').html();
            var id = $(this).data('id');
            var lecturerId = $(this).data('lecturerid');
            var lecturerName = $(this).data('lecturername');
            var name = 'Hội Đồng ' + branchId.trim() + ' ' + (new Date().getFullYear());

            controller.showModal('Lập Hội Đồng', content);

            $('#nbrAssemblyId').val(id).attr('data-type', 0);
            $('#txtAssemblyName').val(name);
            $('#txtLecturerId1').val(lecturerId);
            $('#txtLecturerName1').text(lecturerName);
        });

        $('#btnUpdateAssembly').off('click').on('click', function () {
            var id = $(this).data('id');
            var content = $('#modalAddAssembly').html();

            controller.showModal('Cập Nhật Thông Tin Hội Đồng', content);
            $('#nbrAssemblyId').attr('data-type', 1);
            controller.loadAssembly(id);
        });

        $('#txtLecturerId2').off('change').on('change', function () {
            var result = $('#txtLecturerName2');

            controller.loadLecturer($(this), result);
        });

        $('#txtLecturerId3').off('change').on('change', function () {
            var result = $('#txtLecturerName3');

            controller.loadLecturer($(this), result);
        });

        $('#btnSaveAssembly').off('click').on('click', function () {
            controller.saveAssembly();
        });

        $('#frmAddAssembly').validate({
            rules: {
                txtAssemblyName: { required: true }
            },

            messages: {
                txtAssemblyName: { required: 'Vui lòng nhập tên hội đồng!' }
            }
        });

        /* Delete Assembly */
        $('#btnDeleteAssembly').off('click').on('click', function () {
            var id = $(this).data('id');

            bootbox.confirm({
                title: "Xóa",
                message: "Xóa hội đồng này khỏi hệ thống?",
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
                        controller.deleteAssembly(id);
                    }
                }
            });
        });

        /* Input Point */
        $('#btnInputPoint').off('click').on('click', function () {
            var id = $('#btnInputPoint').data('id');
            var content = $('#modalInputPoint').html();

            controller.showModal('Nhập Điểm', content, 'large');
            controller.loadAssembly(id);
        });

        $('#btnSavePoint').off('click').on('click', function () {
            var id = $(this).data('id');
            controller.savePoint(id);
        });

        $('#frmInputPoint').validate({
            rules: {
                nbrPoint1: {
                    required: true,
                    min: 0,
                    max: 10
                },
                nbrPoint2: {
                    required: true,
                    min: 0,
                    max: 10
                },
                nbrPoint3: {
                    required: true,
                    min: 0,
                    max: 10
                }
            },
            messages: {
                nbrPoint1: {
                    required: 'Vui lòng nhập điểm!',
                    min: 'Điểm phải lớn hơn 0 và nhỏ hơn hoặc bằng 10!',
                    max: 'Điểm phải lớn hơn 0 và nhỏ hơn hoặc bằng 10!'
                },
                nbrPoint2: {
                    required: 'Vui lòng nhập điểm!',
                    min: 'Điểm phải lớn hơn 0 và nhỏ hơn hoặc bằng 10!',
                    max: 'Điểm phải lớn hơn 0 và nhỏ hơn hoặc bằng 10!'
                },
                nbrPoint3: {
                    required: 'Vui lòng nhập điểm!',
                    min: 'Điểm phải lớn hơn 0 và nhỏ hơn hoặc bằng 10!',
                    max: 'Điểm phải lớn hơn 0 và nhỏ hơn hoặc bằng 10!'
                }
            }
        })
    },

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
        controller.registerEvent();
    },
    
    /* Filter Project*/
    loadFilter: function () {
        $('#projectFilter').html($("#projectFilterContent").html());

        controller.loadProjectType('', $('#slProjectTypeIdSearch'));
        controller.loadClass();
    },

    search: function () {
        config.name = $('#txtNameSearch').val();
        config.student = $('#txtStudentSearch').val();
        config.lecturer = $('#txtLecturerSearch').val();
        config.projectTypeId = $('#slProjectTypeIdSearch option:selected').val();
        config.year = $('#slYearSearch option:selected').val();
        config.classId = $('#slClassIdSearch option:selected').val();
        config.pointStatus = $('#slPointStatusSearch option:selected').val();

        controller.loadProjects();
    },

    resetConfig: function () {
        config.name = '';
        config.student = '';
        config.lecturer = '';
        config.projectTypeId = 0;
        config.year = 0;
        config.classId = '';
        config.pointStatus = 2;

        controller.loadClass();
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
    
    /* Select Project Item */
    countProjectCheckedItem: function () {
        var list = $('.checkbox-item');
        var quantity = 0;

        for (var i = 0; i < list.length; i++) {
            if (list[i].checked) quantity++;
        }

        return quantity;
    },

    selectProjectItem: function () {
        $('#btnDeleteProject').attr('class', controller.countProjectCheckedItem() > 0 ? 'btn btn-sm btn-danger shadow-sm' : 'd-none');
    },

    checkAllProject: function () {
        var isChecked = ($('#btnCheckAllProject span').text() == "Chọn tất cả") ? true : false;

        $('.checkbox-item').prop('checked', isChecked);

        $('#btnCheckAllProject').attr('class',
            isChecked
                ? 'btn btn-sm btn-danger shadow-sm'
                : 'btn btn-sm btn-primary shadow-sm'
        );

        $('#btnCheckAllProject').html(
            isChecked
                ? "<i class='fas fa-times fa-sm text-white-50'></i> <span>Bỏ chọn tất cả</span>"
                : "<i class='fas fa-check fa-sm text-white-50'></i> <span>Chọn tất cả</span>"
        );


        $('#btnDeleteProject').attr('class', isChecked ? 'btn btn-sm btn-danger shadow-sm' : 'd-none');
    },

    /* Delete Project */
    deleteProjectSelection: function () {
        var id = [];

        $('.checkbox-item:checked').each(function (i) {
            id[i] = $(this).val();
        });

        $.ajax({
            url: '/API/Project/DeleteSelection',
            data: { id: id },
            type: 'POST',
            dataType: 'json',

            success: function (response) {
                if (response.status) {
                    var data = response.data;
                    var message = '';

                    for (var i = data.length - 1; i >= 0; i--) {
                        if (data[i])
                            message += 'Xóa đề tài #' + id[i] + ' thành công!</br>';
                        else
                            message += 'Xóa đề tài #' + id[i] + ' không thành công!</br>';
                    }

                    bootbox.alert({ message: message });
                    controller.loadProjects();
                } else {
                    bootbox.alert({ message: 'Lỗi hệ thống! Xóa đề tài không thành công!</br>' });
                }
            },

            error: function () {
                bootbox.alert({ message: 'Lỗi hệ thống! Xóa đề tài không thành công!</br>' });
            }
        });
    },

    deleteProject: function (id) {
        $.ajax({
            url: '/API/Project/Delete',
            data: { id: id },
            type: 'POST',
            dataType: 'json',

            success: function (response) {
                if (response.status) {
                    controller.resetConfig();
                    controller.loadProjects();
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

    /* Load Page */
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
                    controller.loadProjects();
                }
            });
        }
    },

    /* Load Project */
    loadProjects: function () {
        $.ajax({
            url: '/API/Project/Get',
            data: {
                name: config.name,
                student: config.student,
                lecturer: config.lecturer,
                projectTypeId: config.projectTypeId,
                year: config.year,
                branchId: branchId,
                classId: config.classId,
                pointStatus: config.pointStatus,
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
                        controller.loadProjects();
                    }

                    var data = response.data;
                    var html = '';
                    var template = $('#projectItem').html();

                    html += $('#tblProjectHeader').html();

                    $.each(data, function (i, item) {
                        html += Mustache.render(template, {
                            Id: item.Id,
                            Name: item.Name,
                            Type: item.Type,
                            StudentId: item.StudentId,
                            StudentName: item.StudentName,
                            LecturerId: item.LecturerId,
                            LecturerName: item.LecturerName,
                            CreatedDate: item.CreatedDate,
                            StartDate: item.StartDate,
                            EndDate: item.EndDate,
                            Point: item.Point == null ? 'Chưa chấm' : (Math.round(item.Point * 10) / 10),

                            /* Assembly */
                            AssemblyName: item.AssemblyName != null ? 'Tên hội đồng: ' + item.AssemblyName + '<br/>' : 'Chưa lập hội đồng<br/>',
                            AssemblyCreatedDate: item.AssemblyName != null ? 'Ngày lập hội đồng: ' + item.AssemblyCreatedDate + '<br/>' : '',
                            AssemblyButton: item.AssemblyName == null ?
                                "<button data-id='" + item.Id + "' data-lecturerid='" + $.trim(item.LecturerId) + "' data-lecturername='" + item.LecturerName + "' class='button-add-assembly btn btn-primary btn-icon-split mt-3'>" +
                                "<span class='icon text-white-50'>" +
                                "<i class='fas fa-plus'></i>" +
                                "</span >" +
                                "<span class='text'>Lập hội đồng</span>" +
                                "</button >"
                                :
                                "<button data-id='" + item.Id + "' class='button-view-assembly btn btn-primary btn-icon-split mt-3'>" +
                                "<span class='icon text-white-50'>" +
                                "<i class='fas fa-eye'></i>" +
                                "</span >" +
                                "<span class='text'>Xem thông tin</span>" +
                                "</button >"
                        });
                    });

                    $('#tblProject').html(html);
                    controller.registerEvent();

                    $('#btnCheckAllProject').show();
                    $('#btnDeleteProject').attr('class', 'd-none');
                    $('#btnExportExcel').removeAttr('style');

                    controller.resetPage(totalPages);
                    controller.paging(totalPages);

                    return;
                }

                $('#btnCheckAllProject').hide();
                $('#btnDeleteProject').attr('class', 'd-none');

                controller.resetPage(0);

                $('#tblProject').html("<div class='alert alert-danger' style='margin-bottom: -15px'>Không có dữ liệu<div>");
                $('#btnExportExcel').attr('style', 'display:none');
            },

            error: function () {
                $('#btnCheckAll').hide();
                $('#btnDelete').attr('class', 'd-none');
                controller.resetPage(0);
                $('#tblData').html("<div class='alert alert-danger' style='margin-bottom: -15px'>Không có dữ liệu<div>");
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

                    $('#nbrId').val(data.Id);
                    $('#txtProjectName').val(data.Name);
                    controller.loadProjectType(data.TypeId, $('#slProjectTypeId'));
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

    /* Add / Update Project */
    saveProject: function () {
        controller.loadStudent($('#txtStudentId'), $('#txtStudentName'));
        controller.loadLecturer($('#txtLecturerId'), $('#txtLecturerName'));

        var studentName = $('#txtStudentName').text();
        var lecturerName = $('#txtLecturerName').text();

        if ($('#frmUpdateProject').valid() && studentName != 'Không tìm thấy sinh viên!' && lecturerName != 'Không tìm thấy giảng viên!') {
            var id = $('#nbrId').val();
            var name = $('#txtProjectName').val();
            var typeId = $('#slProjectTypeId option:selected').val();
            var studentId = $('#txtStudentId').val();
            var lecturerId = $('#txtLecturerId').val();
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
                        controller.loadProjects();
                        $('#modal').modal('hide');

                        bootbox.alert({ message: (id == 0 ? 'Thêm mới ' : 'Cập nhật thông tin ') + 'đề tài thành công!' });
                    }
                    else if (response.status == -1) {
                        bootbox.alert({ message: (id == 0 ? 'Thêm mới ' : 'Cập nhật thông tin ') + 'đề tài không thành công! Thời gian tối thiểu để thực hiện đề tài là 5 tháng!' });
                    }
                    else if (response.status == -2) {
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

    loadLecturer: function (input, result) {
        var id = $.trim(input.val()) == '' ? 'NOID' : input.val();

        $.ajax({
            url: "/API/Lecturer/Get",
            data: {
                id: id,
                branchId: branchId
            },
            type: 'GET',
            dataType: 'json',
            success: function (response) {
                if (response.status) {
                    var data = (response.data)[0];

                    input.attr('class', 'form-control valid');
                    result.removeAttr('style').attr('class', 'valid').text(data.FullName);
                }
                else {
                    input.attr('class', 'form-control error');
                    result.removeAttr('style').attr('class', 'error').text('Không tìm thấy giảng viên!');
                }
            },
            error: function () {
                input.attr('class', 'form-control error');
                result.removeAttr('style').attr('class', 'error').text('Không tìm thấy giảng viên!');
            }
        });
    },

    /* Load Assembly */
    loadAssembly: function (id) {
        $.ajax({
            url: '/API/AssemblyDetail/Get',
            data: {
                id: id
            },
            type: 'GET',
            dataType: 'json',

            success: function (response) {
                if (response.data != null) {

                    var data = response.data;
                    var assembly = data.assembly;
                    var assemblyDetails = data.assemblyDetails;

                    var html = '';
                    var template = $('#assemblyItem').html();

                    $('#btnUpdateAssembly').data('id', id);
                    $('#btnInputPoint').data('id', id);
                    $('#btnDeleteAssembly').data('id', id);
                    $('#btnSavePoint').data('id', id);

                    $('#modalViewAssemblyTitle').text(assembly.Name);
                    $('#txtAssemblyCreatedDate').text(assembly.CreatedDate);

                    $('#nbrAssemblyId').val(id);
                    $('#txtAssemblyName').attr('class', 'form-control valid').val(assembly.Name);

                    $.each(assemblyDetails, function (i, item) {
                        $('#txtLecturerId' + (i + 1)).removeAttr('style').attr('class', 'form-control valid').val($.trim(item.LecturerId));
                        $('#txtLecturerName' + (i + 1)).removeAttr('style').text(item.LecturerName);
                        $('.lecturer-name-' + (i + 1)).text(item.LecturerName);
                        $('#nbrPoint' + (i + 1)).val(item.Point);

                        html += Mustache.render(template, {
                            Id: item.AssemblyId,
                            LecturerId: $.trim(item.LecturerId),
                            LecturerName: item.LecturerName,
                            Permission: i == 0 ? 'Thư ký' : (i == 1 ? 'Chủ tịch' : 'Thành viên'),
                            Point: item.Point == null ? 'Chưa chấm' : item.Point
                        });
                    });

                    $('#assemblyData').html(html);
                    controller.registerEvent();

                    return;
                }
            }
        });
    },

    /* Add Assembly */
    saveAssembly: function () {
        var type = $('#nbrAssemblyId').data('type');
        var assemblyId = $('#nbrAssemblyId').val();

        var lecturerId1 = $('#txtLecturerId1');
        var lecturerId2 = $('#txtLecturerId2');
        var lecturerId3 = $('#txtLecturerId3');

        controller.loadLecturer(lecturerId2, $('#txtLecturerName2'));
        controller.loadLecturer(lecturerId3, $('#txtLecturerName3'));

        var lecturerName2 = $('#txtLecturerName2').text();
        var lecturerName3 = $('#txtLecturerName3').text();

        var formValid = $('#frmAddAssembly').valid();
        var lecturerNotNull = (lecturerName2 == 'Không tìm thấy giảng viên!' || lecturerName3 == 'Không tìm thấy giảng viên!') ? false : true;
        var lecturerNotDuplicate = ($.trim(lecturerId1.val()) == $.trim(lecturerId2.val()) || $.trim(lecturerId2.val()) == $.trim(lecturerId3.val()) || $.trim(lecturerId1.val()) == $.trim(lecturerId3.val())) ? false : true;

        if (formValid && lecturerNotNull) {
            if (lecturerNotDuplicate) {
                
                var name = $('#txtAssemblyName').val();

                var assemblyDetails;
                var assembly = { Id: assemblyId, Name: name };
                
                if (type != 0) {
                    assemblyDetails = [
                        { LecturerId: '' },
                        { LecturerId: lecturerId2.val() },
                        { LecturerId: lecturerId3.val() }
                    ];
                } else {
                    assemblyDetails = [
                        { LecturerId: lecturerId2.val() },
                        { LecturerId: lecturerId3.val() }
                    ];
                }

                $.ajax({
                    url: '/API/Assembly/' + (type == 0 ? 'Insert' : 'Update'),
                    data: {
                        assembly: assembly,
                        assemblyDetails: assemblyDetails
                    },
                    type: 'POST',
                    dataType: 'json',
                    success: function (response) {
                        if (response.status == 1) {
                            $('#modal').modal('hide');
                            controller.loadProjects();
                            controller.loadAssembly(assemblyId);

                            bootbox.alert({ message: (type == 0 ? 'Lập' : 'Cập nhật thông tin') + ' hội đồng thành công!' });
                        } else if (response.status == -1) {
                            bootbox.alert({ message: (type == 0 ? 'Lập' : 'Cập nhật thông tin') + ' hội đồng không thành công! Các giảng viên không được trùng nhau!' });
                        } else {
                            bootbox.alert({ message: (type == 0 ? 'Lập' : 'Cập nhật thông tin') + ' hội đồng không thành công!' });
                        }
                    },
                    error: function () {
                        bootbox.alert({ message: (type == 0 ? 'Lập' : 'Cập nhật thông tin') + ' hội đồng không thành công!' });
                    }
                });
            } else {
                bootbox.alert({ message: (type == 0 ? 'Lập' : 'Cập nhật thông tin') + ' hội đồng không thành công! Các giảng viên không được trùng nhau!' });
            }
        }
    },

    /* Delete Assembly */
    deleteAssembly: function (id) {
        $.ajax({
            url: '/Assembly/Delete',
            data: {
                id: id
            },
            type: 'POST',
            dataType: 'json',
            success: function (response) {
                if (response.status) {
                    bootbox.alert({ message: 'Xóa hội đồng thành công!' });

                    $('#modalViewAssembly').modal('hide');
                    controller.loadProjects();
                } else {
                    bootbox.alert({ message: 'Xóa hội đồng không thành công!' });
                }
            }
        });
    },

    /* Save Point */
    savePoint: function (id) {
        if ($('#frmInputPoint').valid()) {
            var Point1 = $('#nbrPoint1').val();
            var Point2 = $('#nbrPoint2').val();
            var Point3 = $('#nbrPoint3').val();

            var assembly = { Id: id };
            var assemblyDetails = [
                { Point: Point1 },
                { Point: Point2 },
                { Point: Point3 }
            ];

            $.ajax({
                url: '/API/Assembly/Update',
                data: {
                    assembly: assembly,
                    assemblyDetails: assemblyDetails
                },
                type: 'POST',
                dataType: 'json',
                success: function (response) {
                    if (response.status) {
                        controller.loadProjects();
                        controller.loadAssembly(id);

                        $('#modal').modal('hide');

                        bootbox.alert({ message: 'Cập nhật điểm thành công!' });
                    } else {
                        bootbox.alert({ message: 'Cập nhật điểm không thành công!' });
                    }
                }, error: function () {
                    bootbox.alert({ message: 'Cập nhật điểm không thành công!' });
                }
            });
        }
    },    
}

controller.init();
var config = {
    link: '/API/Project/',
    title: 'đề tài'
}

var controller = {
    init: function () {
        controller.loadProjectDetail();
    },

    registerEvent: function () {
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

        /* View Assembly */
        $('#btnViewAssembly').off('click').on('click', function () {
            $('#modalViewAssembly').modal('show');
        });

        /* Update Project */
        $('#btnUpdateProject').off('click').on('click', function () {
            $('#modalUpdateProject').modal('show');
        });

        $('#btnSaveProject').off('click').on('click', function () {
            controller.updateProject();
        });

        $('#txtStudentId').off('change').on('change', function () {
            controller.loadStudent($(this).val());
        });

        /* Update Project Stage */
        $('.button-update-project-stage').off('click').on('click', function () {
            var id = $(this).data('id');

            $('#modalUpdateProjectStageTitle').text('Cập Nhật Thông Tin Giai Đoạn');
            controller.loadProjectStage(id);
            $('#modalUpdateProjectStage').modal('show');
        });

        $('#btnSaveProjectStage').off('click').on('click', function () {
            controller.saveProjectStage();
        });

        /* Add Project Stage*/
        $('#btnAddProjectStage').off('click').on('click', function () {
            $('#modalUpdateProjectStageTitle').text('Thêm Mới Giai Đoạn');
            $('#nbrProjectStageId').val(0);
            $('#frmUpdateProjectStage').trigger('reset');
            $('#modalUpdateProjectStage').modal('show');
        });

        /* Delete Project */
        $('#btnDeleteProject').off('click').on('click', function () {
            bootbox.confirm({
                title: "Xóa " + config.title,
                message: "Xóa " + config.title + " này?",
                buttons: {
                    cancel: {
                        label: '<i class="fa fa-times"></i> Huỷ'
                    },
                    confirm: {
                        label: '<i class="fa fa-check"></i> Đồng ý'
                    }
                },
                callback: function (result) {
                    if (result) {
                        controller.deleteProject();
                    }
                }
            });
        });

        /* Delete Project Stage */
        $('.button-delete-project-stage').off('click').on('click', function () {
            var id = $(this).data('id');

            bootbox.confirm({
                title: "Xóa Giai Đoạn",
                message: "Xóa giai đoạn này khỏi đề tài?",
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
                        controller.deleteProjectStage(id);
                    }
                }
            });
        });
    },

    loadProjectDetail: function () {
        $.ajax({
            url: config.link + 'GetProject',
            data: { id: id },
            type: 'GET',
            dataType: 'json',
            success: function (response) {
                if (response.status) {
                    var data = response.data;
                    var html = '';
                    var template = $('#projectDetailTemplate').html();

                    html += Mustache.render(template, {
                        Name: data.Name,
                        Type: data.Type,
                        StudentName: data.StudentName,
                        LecturerName: data.LecturerName,
                        CreatedDate: data.CreatedDate,
                        StartDate: data.StartDate,
                        EndDate: data.EndDate,
                        AssemblyName: data.AssemblyName != null ? 'Tên hội đồng: ' + data.AssemblyName + '<br/>' : 'Chưa lập hội đồng',
                        AssemblyCreatedDate: data.AssemblyName != null ? 'Ngày lập hội đồng: ' + data.AssemblyCreatedDate : '',
                        AssemblyView: data.AssemblyName != null ? "<button id='btnViewAssembly' class='ml-auto btn btn-primary btn-circle btn-sm' title='Xem bài nộp'><i class='fas fa-eye'></i></button>" : "",
                        SubmissionDate: data.Submission != null ? 'Thời gian nộp: ' + data.SubmissionDate + '<br/>' : '',
                        SubmissionStatus: data.Submission != null ? 'Đã nộp' : 'Chưa nộp',
                        Point: (data.Submission != null && data.Point != null) ? 'Điểm: ' + data.Point : 'Chưa chấm'
                    });

                    $('#projectDetail').html(html);
                    controller.loadProjectStages();

                    $('#txtProjectName').val(data.Name);
                    $('#txtStudentId').val(data.StudentId);
                    $('#txtStudentName').text(data.StudentName);

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

    loadProjectStages: function () {
        $.ajax({
            url: config.link + 'GetProjectStages',
            data: { projectId: id },
            type: 'GET',
            dataType: 'json',
            success: function (response) {
                if (response.status) {
                    var data = response.data;
                    var html = '';
                    var template = $('#projectStageTemplate').html();

                    $.each(data, function (i, item) {
                        html += Mustache.render(template, {
                            Id: item.Id,
                            Name: item.Name,
                            StartDate: item.StartDate,
                            EndDate: item.EndDate,
                            Intent: item.Intent,
                            Request: item.Request,
                            SubmissionDate: item.Submission != null ? 'Thời gian nộp: ' + item.SubmissionDate + '<br/>' : '',
                            SubmissionStatus: item.Submission != null ? 'Đã nộp' : 'Chưa nộp',
                            Status: item.Status
                        });
                    });

                    $('#projectStage').html(html);

                    controller.registerEvent();
                }
            }
        })
    },

    loadProjectStage: function (id) {
        $.ajax({
            url: config.link + 'GetProjectStage',
            data: { id: id },
            type: 'GET',
            dataType: 'json',
            success: function (response) {
                if (response.status) {
                    var data = response.data;

                    $('#nbrProjectStageId').val(data.Id);
                    $('#txtProjectStageName').val(data.Name);

                    var startDateTime = data.StartDate.split(' ');
                    var startDate = startDateTime[0].split('/');
                    var startTime = startDateTime[1].split(':');

                    $('#dtProjectStageStartDate').val(startDate[2] + '-' + startDate[1] + '-' + startDate[0]);
                    $('#slProjectStageStartHour option')[parseInt(startTime[0])].selected = true;
                    $('#slProjectStageStartMinute option')[parseInt(startTime[1])].selected = true;

                    var endDateTime = data.EndDate.split(' ');
                    var endDate = endDateTime[0].split('/');
                    var endTime = endDateTime[1].split(':');

                    $('#dtProjectStageEndDate').val(endDate[2] + '-' + endDate[1] + '-' + endDate[0]);
                    $('#slProjectStageEndHour option')[parseInt(endTime[0])].selected = true;
                    $('#slProjectStageEndMinute option')[parseInt(endTime[1])].selected = true;

                    $('#txtIntent').val(data.Intent);
                    $('#txtRequest').val(data.Request);
                }
            }
        })
    },

    updateProject: function () {
        var studentName = $('#txtStudentName').text();

        if ($('#frmUpdateProject').valid() && studentName != 'Không tìm thấy sinh viên') {
            var name = $('#txtProjectName').val();
            var typeId = $('#slTypeId option:selected').val();
            var studentId = $('#txtStudent').data('id');
            var startDate = $('#dtProjectStartDate').val() + ' ' + $('#slProjectStartHour option:selected').val() + ':' + $('#slProjectStartMinute option:selected').val();
            var endDate = $('#dtProjectEndDate').val() + ' ' + $('#slProjectEndHour option:selected').val() + ':' + $('#slProjectEndMinute option:selected').val();

            var model = {
                Id: id,
                Name: name,
                TypeId: typeId,
                StudentId: studentId,
                StartDate: startDate,
                EndDate: endDate
            };

            $.ajax({
                url: config.link + 'Update',
                data: { model: model },
                type: 'POST',
                dataType: 'json',
                success: function (response) {
                    if (response.status) {
                        controller.loadProjectDetail();
                        $('#modalUpdateProject').modal('hide');

                        bootbox.alert({ message: 'Cập nhật thông tin ' + config.title + ' thành công!' });
                    } else {
                        bootbox.alert({ message: 'Cập nhật thông tin ' + config.title + ' không thành công!' });
                    }
                }
            });
        }
    },

    saveProjectStage: function () {
        var id = $('#nbrProjectStageId').val();
        var name = $('#txtProjectStageName').val();

        var startDate = $('#dtProjectStageStartDate').val() + ' ';
        startDate += $('#slProjectStageStartHour option:selected').val() + ':';
        startDate += $('#slProjectStageStartMinute').val() + ':00';

        var endDate = $('#dtProjectStageEndDate').val() + ' ';
        endDate += $('#slProjectStageEndHour option:selected').val() + ':';
        endDate += $('#slProjectStageEndMinute').val() + ':00';

        var intent = $('#txtIntent').val();
        var request = $('#txtRequest').val();

        var model = {
            Id: parseInt(id),
            ProjectId: config.projectId,
            Name: name,
            StartDate: startDate,
            EndDate: endDate,
            Intent: intent,
            Request: request,
            Status: false
        };

        var link = config.link + (id > 0 ? 'UpdateProjectStage' : 'InsertProjectStage');
        var message = id > 0 ? 'Cập nhật thông tin giai đoạn' : 'Thêm mới giai đoạn';

        $.ajax({
            url: link,
            data: { model: model },
            type: 'POST',
            dataType: 'json',
            success: function (response) {
                if (response.status) {
                    bootbox.alert({ message: message + ' thành công!' });
                    controller.loadProjectDetail();
                } else {
                    bootbox.alert({ message: message + ' không thành công!' });
                }
            },
            error: function () {
                bootbox.alert({ message: message + ' không thành công!' });
            }
        });

        $('#modalUpdateProjectStage').modal('hide');
    },

    deleteProject: function () {
        $.ajax({
            url: config.link + 'Delete',
            data: { id: config.projectId },
            type: 'POST',
            dataType: 'json',
            success: function (response) {
                if (response.status) {
                    bootbox.alert({ message: 'Xóa ' + config.title + ' thành công!' });
                    setTimeout(function () { window.location.href = '/Project/My'; }, 1500);
                } else {
                    bootbox.alert({ message: 'Xóa ' + config.title + ' không thành công!' });
                }
            },
            error: function () {
                bootbox.alert({ message: 'Xóa ' + config.title + ' không thành công!' });
            }
        });
    },

    deleteProjectStage: function (id) {
        $.ajax({
            url: config.link + 'DeleteProjectStage',
            data: { id: id },
            type: 'POST',
            dataType: 'json',
            success: function (response) {
                if (response.status) {
                    controller.loadProjectDetail();

                    bootbox.alert({ message: 'Xóa giai đoạn thành công!' });
                } else {
                    bootbox.alert({ message: 'Xóa giai đoạn không thành công!' });
                }
            },
            error: function () {
                bootbox.alert({ message: 'Xóa giai đoạn không thành công!' });
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
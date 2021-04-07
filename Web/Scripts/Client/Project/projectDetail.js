var config = {
    lecturerId: 0,
    studentId: 0
};

var projectDetailController = {
    init: function () {
        projectDetailController.loadProject();
    },

    registerEvent: function () {
        /* Update Project */
        $('#btnUpdateProject').off('click').on('click', function () {
            var id = $(this).data('id');

            projectDetailController.showModal('Cập Nhật Thông Tin Đề Tài', $('#modalUpdateProject'));
            projectDetailController.loadProject(1);

            $('#frmUpdateProject input').attr('class', 'form-control valid');
            $('#frmUpdateProject select').attr('class', 'form-control valid');
        });

        $('#btnSaveProject').off('click').on('click', function () {
            projectDetailController.updateProject();
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
            projectDetailController.loadStudent($(this), $('#txtStudentName'));
        });

        /* Delete Project */
        $('#btnDeleteProject').off('click').on('click', function () {
            bootbox.confirm({
                title: 'Xóa Đề Tài',
                message: "Xóa đề tài này khỏi hệ thống?",
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
                        projectDetailController.deleteProject();
                    }
                }
            });
        });

        /* Add / Update Project Stage*/
        $('#btnAddProjectStage').off('click').on('click', function () {
            projectDetailController.showModal('Thêm Mới Giai Đoạn', $('#modalUpdateProjectStage'), 'large');
            projectDetailController.loadCKEditor('txtIntent');
            projectDetailController.loadCKEditor('txtRequest');
        });

        $('.button-update-project-stage').off('click').on('click', function () {
            var id = $(this).data('id');

            projectDetailController.showModal('Cập Nhật Thông Tin Giai Đoạn', $('#modalUpdateProjectStage'), 'large');
            projectDetailController.loadProjectStage(id);
            $('#frmUpdateProjectStage input').attr('class', 'form-control valid');
            $('#frmUpdateProjectStage select').attr('class', 'form-control valid');
        });

        $('#btnSaveProjectStage').off('click').on('click', function () {
            projectDetailController.saveProjectStage();
        });

        $('#frmUpdateProjectStage').validate({
            rules: {
                txtProjectStageName: { required: true },
                dtProjectStageStartDate: { required: true },
                slProjectStageStartHour: { required: true },
                slProjectStageStartMinute: { required: true },
                dtProjectStageEndDate: { required: true },
                slProjectStageEndHour: { required: true },
                slProjectStageEndMinute: { required: true },
                txtIntent: { required: true },
                txtRequest: { required: true }
            },
            messages: {
                txtProjectStageName: { required: 'Vui lòng nhập tên giai đoạn' },
                dtProjectStageStartDate: { required: 'Vui lòng nhập ngày bắt đầu' },
                slProjectStageStartHour: { required: 'Vui lòng nhập giờ bắt đầu' },
                slProjectStageStartMinute: { required: 'Vui lòng nhập phút bắt đầu' },
                dtProjectStageEndDate: { required: 'Vui lòng nhập ngày kết thúc' },
                slProjectStageEndHour: { required: 'Vui lòng nhập giờ kết thúc' },
                slProjectStageEndMinute: { required: 'Vui lòng nhập phút kết thúc' },
                txtIntent: { required: 'Vui lòng nhập mục đích' },
                txtRequest: { required: 'Vui lòng nhập yêu cầu' }
            }
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
                        projectDetailController.deleteProjectStage(id);
                    }
                }
            });
        });

        /* Add / Update Project Submission */
        $('#btnUpdateSubmission').off('click').on('click', function () {
            var id = $(this).data('id');

            projectDetailController.showModal('Cập Nhật Bài Nộp', $('#modalUpdateProjectSubmission'));
            projectDetailController.loadSubmission(id, 0);
        });

        $('#btnSaveProjectSubmission').off('click').on('click', function () {
            projectDetailController.saveSubmission();
        });

        $('#frmUpdateProjectSubmission').validate({
            rules: {
                txtSubmission: { required: true }
            },
            messages: {
                txtSubmission: { required: 'Vui lòng nhập bài nộp' }
            }
        });

        /* Delete Project Submission */
        $('#btnDeleteSubmission').off('click').on('click', function () {
            var id = $(this).data('id');

            bootbox.confirm({
                title: "Xóa Bài Nộp",
                message: "Xóa bài nộp này khỏi đề tài?",
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
                        projectDetailController.deleteSubmission(id);
                    }
                }
            });
        });

        /* Add / Update Project Stage Submission */
        $('.button-update-submission').off('click').on('click', function () {
            var id = $(this).data('id');

            projectDetailController.showModal('Cập Nhật Bài Nộp', $('#modalUpdateProjectStageSubmission'));
            projectDetailController.loadSubmission(id, 1);
        });

        $('#btnSaveProjectStageSubmission').off('click').on('click', function () {
            projectDetailController.saveSubmission(1);
        });

        /* Delete Project Stage Submission */
        $('.button-delete-submission').off('click').on('click', function () {
            var id = $(this).data('id');

            bootbox.confirm({
                title: "Xóa Bài Nộp",
                message: "Xóa bài nộp này khỏi giai đoạn đề tài?",
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
                        projectDetailController.deleteSubmission(id, 1);
                    }
                }
            });
        });

        /* View / Add / Update Comment Submission */
        $('.button-comment-submission').off('click').on('click', function () {
            var id = $(this).data('id');

            $('#modalCommnetSubmission').modal('show');
            projectDetailController.loadComment(id);
        });

        $('#btnUpdateCommentSubmission').off('click').on('click', function () {
            var title = 'Nhận Xét Giai Đoạn';
            var content = $('#modalUpdateCommentSubmission');
            var id = $(this).data('id');

            projectDetailController.showModal(title, content, 'large');
            projectDetailController.loadComment(id, 2);
        });

        $('#btnSaveComment').off('click').on('click', function () {
            projectDetailController.saveComment();
        });

        $('#frmCommentSubmission').validate({
            rules: {
                txtComment: { required: true }
            },
            messages: {
                txtComment: { required: 'Vui lòng nhập nhận xét' }
            }
        });

        /* Delete Comment Submisison */
        $('#btnDeleteCommentSubmission').off('click').on('click', function () {
            var id = $(this).data('id');

            bootbox.confirm({
                title: "Xóa Nhận Xét Giai Đoạn",
                message: "Xóa nhận xét cho giai đoạn này?",
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
                        projectDetailController.deleteComment(id);
                    }
                }
            });
        });

        /* View Assembly */
        $('#btnViewAssembly').off('click').on('click', function () {
            var id = $(this).data('id');

            $('#modalViewAssembly').modal('show');
            projectDetailController.loadAssembly(id);
        });

        /* Input Point */
        $('#btnInputPoint').off('click').on('click', function () {
            var id = $('#btnInputPoint').data('id');
            var content = $('#modalInputPoint');

            projectDetailController.showModal('Nhập Điểm', content, 'large');
            projectDetailController.loadAssembly(id);
        });

        $('#btnSavePoint').off('click').on('click', function () {
            var id = $(this).data('id');
            projectDetailController.savePoint(id);
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

    /* CKEditor */
    loadCKEditor: function (input) {
        CKEDITOR.replace(input);
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
        $('#modalContent').html(content.html());
        $('#modal').modal('show');
        projectDetailController.registerEvent();
    },

    /* Load Project */
    loadProject: function (type) {
        $.ajax({
            url: '/API/Project/Get',
            data: { id: projectId },
            type: 'GET',
            dataType: 'json',
            success: function (response) {
                if (response.status) {
                    var data = (response.data)[0];

                    if (data.LecturerId == lecturerId || data.StudentId == studentId) {
                        var data = (response.data)[0];
                    config.lecturerId = data.LecturerId;
                    config.studentId = data.StudentId;

                    if (type == 1) {
                        $('#txtProjectName').val(data.Name);
                        projectDetailController.loadProjectType(data.TypeId, $('#slProjectTypeId'));
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
                    } else {
                        var html = '';
                        var template = $('#projectDetailItem').html();

                        /* End Date Time */
                        var startDateTime = projectDetailController.setDateTime(data.StartDate);
                        var endDateTime = projectDetailController.setDateTime(data.EndDate);

                        /* Submission Date Time */
                        var submissionDateTime;

                        if (data.Submission != null) {
                            submissionDateTime = projectDetailController.setDateTime(data.SubmissionDate);
                        } else submissionDateTime = new Date();

                        var lateSubmission = data.Submission != null ? projectDetailController.dateDiff(endDateTime, submissionDateTime, 1) : projectDetailController.dateDiff(endDateTime, new Date());
                        $('#btnInputPoint').attr('style', data.Submission != null ? '' : 'display: none');

                        html += Mustache.render(template, {
                            Id: data.Id,
                            Name: data.Name,
                            Type: data.TypeName,
                            StudentName: data.StudentName,
                            ClassId: data.ClassId,
                            LecturerName: data.LecturerName,
                            CreatedDate: data.CreatedDate,
                            StartDate: data.StartDate,
                            EndDate: data.EndDate,

                            /* Assembly */
                            AssemblyName: data.AssemblyName != null ? 'Tên hội đồng: ' + data.AssemblyName + '<br/>' : 'Chưa lập hội đồng',
                            AssemblyCreatedDate: data.AssemblyName != null ? 'Ngày lập hội đồng: ' + data.AssemblyCreatedDate : '',
                            AssemblyView: data.AssemblyName != null ? (
                                "<button id='btnViewAssembly' data-id='" + data.Id + "' class='ml-auto btn btn-primary btn-circle btn-sm' title='Xem hội đồng'>" +
                                "<i class='fas fa-eye'></i>" +
                                "</button>")
                                : "",

                            /* Update / Delete Project */
                            UpdateProjectButton: (data.LecturerId == lecturerId) ? (
                                "<button id='btnUpdateProject' data-id='" + data.Id + "' class='mb-4 btn btn-primary btn-icon-split'>" + 
                                    "<span class='icon text-white-50'>" + 
                                        "<i class='fas fa-edit'></i>" + 
                                    "</span>" +
                                    "<span class='text'>Cập nhật thông tin đề tài</span>" + 
                                "</button>"
                            ) : "",
                            DeleteProjectButton: (data.LecturerId == lecturerId) ? (
                                "<button id='btnDeleteProject' data-id='" + data.Id + "' class='mb-4 btn btn-danger btn-icon-split'>" +
                                    "<span class='icon text-white-50'>" +
                                        "<i class='fas fa-trash'></i>" +
                                    "</span>" +
                                    "<span class='text'>Xóa đề tài</span>" +
                                "</button>"
                            ) : "",
                            AddProjectStageButton: (config.lecturerId == lecturerId) ? (
                                "<div class='project-tool'>" + 
                                    "<button id='btnAddProjectStage' class='mb-3 btn btn-primary btn-icon-split'>" +
                                        "<span class='icon text-white-50'>" +
                                            "<i class='fas fa-plus'></i>" +
                                        "</span>" +
                                        "<span class='text'>Thêm mới giai đoạn</span>" +
                                    "</button>" +
                                "</div>"
                            ) : "",

                            /* Submission */
                            SubmissionView: data.Submission != null ? (
                                (lateSubmission.search('Nộp sớm') >= 0)
                                    ? 'submission submission-primary'
                                    : 'submission submission-danger'
                            ) : (
                                (lateSubmission.search('Quá hạn') >= 0)
                                    ? 'submission submission-danger'
                                    : 'submission submission-secondary'
                            ),

                            /* Button View / Add / Update / Delete / Input Point Submission */
                            SubmissionViewButton: data.Submission != null ? (
                                "<a href='" + data.Submission + "' class='mt-2 btn btn-primary btn-icon-split' target='_blank'>" +
                                    "<span class='icon text-white-50'>" +
                                        "<i class='fas fa-eye'></i>" +
                                    "</span>" +
                                    "<span class='text'>Xem bài nộp</span>" +
                                "</a>")
                                : "",
                            UpdateSubmissionButton: (data.Submission != null && config.studentId == studentId) ? (
                                "<button id='btnUpdateSubmission' data-id='" + data.Id + "' class='mt-2 btn btn-primary btn-icon-split'>" +
                                    "<span class='icon text-white-50'>" +
                                        "<i class='fas fa-edit'></i>" +
                                    "</span>" +
                                    "<span class='text'>Sửa bài nộp</span>" +
                                "</button>")
                                : "",
                            DeleteSubmissionButton: (data.Submission != null && config.studentId == studentId) ? (
                                "<button id='btnDeleteSubmission' data-id='" + data.Id + "' class='mt-2 btn btn-danger btn-icon-split'>" +
                                    "<span class='icon text-white-50'>" +
                                        "<i class='fas fa-trash'></i>" +
                                    "</span>" +
                                    "<span class='text'>Xoá bài nộp</span>" +
                                "</button>")
                                : "",
                            SubmissionButton: (data.Submission == null && config.studentId == studentId && (new Date() - startDateTime > 0) && (new Date() - endDateTime < 0)) ? (
                                "<button id='btnUpdateSubmission' data-id='" + data.Id + "' class='mt-2 btn btn-primary btn-icon-split' target='_blank'>" +
                                    "<span class='icon text-white-50'>" +
                                        "<i class='fas fa-check'></i>" +
                                    "</span>" +
                                    "<span class='text'>Nộp bài</span>" +
                                "</button>")
                                : "",
                            InputPointButton: (data.Submission != null && data.AssemblyName != null && data.LecturerId == lecturerId) ? (
                                "<button id='btnInputPoint' data-id='" + data.Id + "' class='mt-2 btn btn-primary btn-icon-split'>" +
                                    "<span class='icon text-white-50'>" +
                                        "<i class='fas fa-eye'></i>" +
                                    "</span>" +
                                    "<span class='text'>Nhập điểm</span>" +
                                "</button>")
                                : "",
                            SubmissionDate: data.Submission != null ? 'Thời gian nộp: ' + data.SubmissionDate + '<br/>' : '',
                            LateSubmission: lateSubmission,
                            SubmissionStatus: data.Submission != null ? 'Đã nộp' : 'Chưa nộp',
                            Point: data.Submission != null ? (data.Point != null ? ('Điểm: ' + (Math.round(data.Point * 10) / 10)) : 'Điểm: Chưa chấm điểm') : ''
                        });

                        $('#projectDetail').html(html);
                        projectDetailController.loadProjectStages();
                    }

                    projectDetailController.registerEvent();
                    } else { location = '/404'; }
                } else { location = '/404'; }
            }
        });
    },

    /* Update Project */
    updateProject: function () {
        projectDetailController.loadStudent($('#txtStudentId'), $('#txtStudentName'));
        var studentName = $('#txtStudentName').text();

        if ($('#frmUpdateProject').valid() && studentName != 'Không tìm thấy sinh viên!') {
            var name = $('#txtProjectName').val();
            var typeId = $('#slProjectTypeId option:selected').val();
            var studentId = $('#txtStudentId').val();

            var startDate = $('#dtProjectStartDate').val() + ' ';
            startDate += $('#slProjectStartHour option:selected').val() + ':';
            startDate += $('#slProjectStartMinute option:selected').val() + ':00';

            var endDate = $('#dtProjectEndDate').val() + ' ';
            endDate += $('#slProjectEndHour option:selected').val() + ':'
            endDate += $('#slProjectEndMinute option:selected').val() + ':00';

            var model = {
                Id: projectId,
                Name: name,
                TypeId: typeId,
                StudentId: studentId,
                StartDate: startDate,
                EndDate: endDate
            };

            $.ajax({
                url: '/API/Project/Update',
                data: { model: model },
                type: 'POST',
                dataType: 'json',
                success: function (response) {
                    if (response.status == 1) {
                        projectDetailController.loadProject();
                        $('#modal').modal('hide');

                        bootbox.alert({ message: 'Cập nhật thông tin đề tài thành công!' });
                    } else if (response.status == -1) {
                        bootbox.alert({ message: 'Cập nhật thông tin đề tài không thành công! Thời gian tối thiểu để thực hiện đề tài là 5 tháng!' });
                    } else {
                        bootbox.alert({ message: 'Cập nhật thông tin đề tài không thành công!' });
                    }
                },
                error: function () {
                    bootbox.alert({ message: 'Cập nhật thông tin đề tài không thành công!' });
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
    deleteProject: function () {
        $.ajax({
            url: '/API/Project/Delete',
            data: { id: projectId },
            type: 'POST',
            dataType: 'json',
            success: function (response) {
                if (response.status) {
                    bootbox.alert({ message: 'Xóa đề tài thành công!' });
                    setTimeout(function () { window.location.href = '/Project/My'; }, 1500);
                } else {
                    bootbox.alert({ message: 'Xóa đề tài không thành công!' });
                }
            },
            error: function () {
                bootbox.alert({ message: 'Xóa đề tài không thành công!' });
            }
        });
    },

    /* Load Submission */
    loadSubmission: function (id, type) {
        var link = '/API/' + (type == 1 ? 'ProjectStage' : 'Project') + '/Get';

        $.ajax({
            url: link,
            data: {
                id: id
            },
            type: 'GET',
            dataType: 'json',
            success: function (response) {
                if (response.status) {
                    var data = response.data[0];

                    $('#nbrId').val(data.Id);
                    $('#txtSubmission').val(data.Submission);
                }
            },
            error: function () {

            }
        })
    },

    /* Update Submision */
    saveSubmission: function (type) {
        if ($('#frmUpdateProjectSubmission').valid()) {
            var id = $('#nbrId').val();
            var submission = $('#txtSubmission').val();
            var link = '/API/' + (type == 1 ? 'ProjectStage' : 'Project') + '/Update';

            var model = {
                Id: id,
                Submission: submission
            };

            $.ajax({
                url: link,
                data: {
                    model: model
                },
                type: 'POST',
                dataType: 'json',
                success: function (response) {
                    if (response.status) {
                        $('#modal').modal('hide');
                        projectDetailController.loadProject();

                        bootbox.alert({ message: 'Cập nhật bài nộp ' + (type == 1 ? 'giai đoạn' : '') + ' thành công!' })
                    } else {
                        bootbox.alert({ message: 'Cập nhật bài nộp ' + (type == 1 ? 'giai đoạn' : '') + ' không thành công!' })
                    }
                },
                error: function () {
                    bootbox.alert({ message: 'Cập nhật bài nộp ' + (type == 1 ? 'giai đoạn' : '') + ' không thành công!' })
                }
            })
        }
    },

    /* Delete Submission */
    deleteSubmission: function (id, type) {
        var model = { Id: id, Submission: 'Delete', Comment: 'Delete' };
        var link = '/API/' + (type == 1 ? 'ProjectStage' : 'Project') + '/Update';

        $.ajax({
            url: link,
            data: { model: model },
            type: 'POST',
            dataType: 'json',
            success: function (response) {
                if (response.status) {
                    $('#modal').modal('hide');
                    projectDetailController.loadProject();

                    bootbox.alert({ message: 'Xoá bài nộp ' + (type == 1 ? 'giai đoạn' : '') + ' thành công!' })
                } else {
                    bootbox.alert({ message: 'Xoá bài nộp ' + (type == 1 ? 'giai đoạn' : '') + ' không thành công!' })
                }
            },
            error: function () {
                bootbox.alert({ message: 'Xoá bài nộp ' + (type == 1 ? 'giai đoạn' : '') + ' không thành công!' })
            }
        });
    },


    /* Date Time */
    dateDiff: function (startDate, endDate, type) {

        var millisBetween = endDate - startDate;
        var status;

        if (type == 1) {
            status = (millisBetween > 0) ? 'Nộp trễ ' : 'Nộp sớm ';
        } else {
            status = (millisBetween > 0) ? 'Quá hạn ' : '';
        }

        millisBetween = Math.abs(millisBetween);
        var years = Math.floor(millisBetween / (1000 * 3600 * 24 * 30 * 12));
        millisBetween -= 1000 * 3600 * 24 * 30 * 12 * years;

        var months = Math.floor(millisBetween / (1000 * 3600 * 24 * 30));
        millisBetween -= 1000 * 3600 * 24 * 30 * months;

        var days = Math.floor(millisBetween / (1000 * 3600 * 24));
        millisBetween -= 1000 * 3600 * 24 * days;

        var hours = Math.floor(millisBetween / (1000 * 3600));
        millisBetween -= 1000 * 3600 * hours;

        var minutes = Math.floor(millisBetween / (1000 * 60));
        millisBetween -= 1000 * 60 * minutes;

        var seconds = Math.floor(millisBetween / 1000);

        var strYear = (years > 0) ? (years + ' năm ') : '';
        var strMonth = (months > 0) ? (months + ' tháng ') : '';
        var strDay = (days > 0) ? (days + ' ngày ') : '';
        var strHour = (hours > 0) ? (hours + ' giờ ') : '';
        var strMinute = (minutes > 0) ? (minutes + ' phút ') : '';

        if (years > 0) return status + strYear + strMonth;
        else if (months > 0) return status + strMonth + strDay;
        else if (days > 0) return status + strDay + strHour;
        else if (hours > 0) return status + strHour + strMinute;
        else if (minutes > 0) return status + strMinute + (seconds > 0 ? (seconds + ' giây ') : '');
        else return status + seconds + ' giây';
    },

    setDateTime: function (dateTime) {
        var strDateTime = (dateTime).split(' ');
        var strDate = (strDateTime[0]).split('/');
        var strTime = (strDateTime[1]).split(':');

        var result = new Date();
        result.setFullYear(strDate[2]);
        result.setMonth(strDate[1] - 1);
        result.setDate(strDate[0]);
        result.setHours(strTime[0]);
        result.setMinutes(strTime[1]);
        result.setSeconds(strTime[2]);

        return result;
    },

    /* Load Project Stage */
    loadProjectStages: function () {
        $.ajax({
            url: '/API/ProjectStage/Get',
            data: { projectId: projectId },
            type: 'GET',
            dataType: 'json',
            success: function (response) {
                if (response.status) {
                    var data = response.data;
                    var html = '';
                    var template = $('#projectStageItem').html();

                    $.each(data, function (i, item) {
                        var startDateTime = projectDetailController.setDateTime(item.StartDate);
                        var endDateTime = projectDetailController.setDateTime(item.EndDate);

                        /* Submission Date Time */
                        var submissionDateTime;
                        if (item.Submission != null) {
                            submissionDateTime = projectDetailController.setDateTime(item.SubmissionDate);
                        } else submissionDateTime = new Date();

                        var lateSubmission = item.Submission != null ? projectDetailController.dateDiff(endDateTime, submissionDateTime, 1) : projectDetailController.dateDiff(endDateTime, new Date());

                        html += Mustache.render(template, {
                            Id: item.Id,
                            Name: item.Name,
                            StartDate: item.StartDate,
                            EndDate: item.EndDate,
                            Intent: item.Intent,
                            Request: item.Request,

                            /* Button Update / Delete Project Stage */

                            UpdateProjectStageButton: (config.lecturerId == lecturerId) ? (
                                "<button data-id='" + item.Id + "' class='button-update-project-stage mb-2 btn btn-primary btn-icon-split'>" +
                                    "<span class='icon text-white-50'>" +
                                        "<i class='fas fa-edit'></i>" +
                                    "</span>" +
                                    "<span class='text'>Cập nhật thông tin giai đoạn</span>" +
                                "</button>"
                            ) : "",

                            DeleteProjectStageButton: (config.lecturerId == lecturerId) ? (
                                "<button data-id='" + item.Id + "' class='button-delete-project-stage mb-2 btn btn-danger btn-icon-split'>" +
                                    "<span class='icon text-white-50'>" +
                                        "<i class='fas fa-trash'></i>" +
                                    "</span>" + 
                                    "<span class='text'>Xóa giai đoạn</span>" +
                                "</button>"
                            ): "",

                            /* Submission */
                            SubmissionView: item.Submission != null
                            ? (
                                (lateSubmission.search('Nộp sớm') >= 0)
                                    ? 'submission submission-primary'
                                    : 'submission submission-danger'
                            ) : (
                                (lateSubmission.search('Quá hạn') >= 0)
                                    ? 'submission submission-danger'
                                    : 'submission submission-secondary'
                            ),

                            /* Button View / Add / Update / Delete / View Comment Submission */
                            SubmissionViewButton: item.Submission != null ? (
                                "<a href='" + item.Submission + "' class='mt-2 btn btn-primary btn-icon-split' target='_blank'>" + 
                                    "<span class='icon text-white-50'>" +
                                        "<i class='fas fa-eye'></i>" +
                                    "</span>" + 
                                    "<span class='text'>Xem bài nộp</span>" + 
                                "</a>" )
                                : "",
                            UpdateSubmissionButton: (item.Submission != null && (config.studentId == studentId) && (new Date() - endDateTime < 0)) ? (
                                "<button data-id='" + item.Id + "' class='mt-2 button-update-submission  btn btn-primary btn-icon-split'>" +
                                    "<span class='icon text-white-50'>" +
                                        "<i class='fas fa-edit'></i>" +
                                    "</span>" +
                                "<span class='text'>Sửa bài nộp</span>" +
                                "</button>")
                                : "",
                            DeleteSubmissionButton: (item.Submission != null && (config.studentId == studentId) && (new Date() - endDateTime < 0)) ? (
                                "<button data-id='" + item.Id + "' class='mt-2 btn button-delete-submission btn-danger btn-icon-split'>" +
                                    "<span class='icon text-white-50'>" +
                                        "<i class='fas fa-trash'></i>" +
                                    "</span>" +
                                    "<span class='text'>Xoá bài nộp</span>" +
                                "</button>")
                                : "",
                            SubmissionButton: (item.Submission == null && (config.studentId == studentId) && (new Date() - startDateTime > 0) && (new Date() - endDateTime < 0)) ? (
                                "<button data-id='" + item.Id + "'class='mt-2 btn button-update-submission btn-primary btn-icon-split' target='_blank'>" +
                                    "<span class='icon text-white-50'>" +
                                        "<i class='fas fa-check'></i>" +
                                    "</span>" +
                                    "<span class='text'>Nộp bài</span>" +
                                "</button>")
                                : "",

                            SubmissionCommentButton: (item.Submission != null) ? (
                                "<button data-id='" + item.Id + "' class='button-comment-submission btn btn-primary btn-icon-split mt-2'>" + 
                                    "<span class='icon text-white-50'>" +
                                        "<i class='fas fa-eye'></i>" +
                                    "</span>" + 
                                    "<span class='text'>Nhận xét</span>" + 
                                "</button>") : '',

                            SubmissionDate: item.Submission != null ? 'Thời gian nộp: ' + item.SubmissionDate + '<br />' : '',
                            LateSubmission: lateSubmission,
                            SubmissionStatus: item.Submission != null ? 'Đã nộp' : 'Chưa nộp',
                            Status: item.Status
                        });
                    });

                    $('#projectStage').html(html);

                    projectDetailController.registerEvent();
                }
            }
        })
    },

    loadProjectStage: function (id) {
        $.ajax({
            url: '/API/ProjectStage/Get',
            data: { id: id },
            type: 'GET',
            dataType: 'json',
            success: function (response) {
                if (response.status) {
                    var data = response.data[0];

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

                    projectDetailController.loadCKEditor("txtIntent");
                    projectDetailController.loadCKEditor("txtRequest");
                }
            }
        })
    },

    /* Add / Update Project Stage */
    saveProjectStage: function () {
        if ($('#frmUpdateProjectStage').valid()){
            var id = $('#nbrProjectStageId').val();
            var name = $('#txtProjectStageName').val();

            var startDate = $('#dtProjectStageStartDate').val() + ' ';
            startDate += $('#slProjectStageStartHour option:selected').val() + ':';
            startDate += $('#slProjectStageStartMinute').val() + ':00';

            var endDate = $('#dtProjectStageEndDate').val() + ' ';
            endDate += $('#slProjectStageEndHour option:selected').val() + ':';
            endDate += $('#slProjectStageEndMinute').val() + ':00';

            var intent = CKEDITOR.instances['txtIntent'].getData();
            var request = CKEDITOR.instances['txtRequest'].getData();

            intent = intent == '' ? 'Không có' : intent;
            request = request == '' ? 'Không có' : request;

            var model = {
                Id: parseInt(id),
                ProjectId: projectId,
                Name: name,
                StartDate: startDate,
                EndDate: endDate,
                Intent: intent,
                Request: request
            };

            var link = '/API/ProjectStage/' + (id > 0 ? 'Update' : 'Insert');
            var message = id > 0 ? 'Cập nhật thông tin giai đoạn' : 'Thêm mới giai đoạn';

            $.ajax({
                url: link,
                data: { model: model },
                type: 'POST',
                dataType: 'json',
                success: function (response) {
                    if (response.status) {
                        bootbox.alert({ message: message + ' thành công!' });
                        projectDetailController.loadProject();
                    } else {
                        bootbox.alert({ message: message + ' không thành công!' });
                    }
                },
                error: function () {
                    bootbox.alert({ message: message + ' không thành công!' });
                }
            });

            $('#modal').modal('hide');
        }
    },

    /* Delete Project Stage */
    deleteProjectStage: function (id) {
        $.ajax({
            url: '/API/ProjectStage/Delete',
            data: { id: id },
            type: 'POST',
            dataType: 'json',
            success: function (response) {
                if (response.status) {
                    projectDetailController.loadProject();

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

    /* Load Comment */
    loadComment: function (id, type) {
        $.ajax({
            url: '/API/ProjectStage/Get',
            data: {
                id: id
            },
            type: 'GET',
            dataType: 'json',
            success: function (response) {
                if (response.status) {
                    var data = response.data[0];

                    if (type == 2) {
                        $('#nbrProjectStageId').val(data.Id);
                        $('#txtComment').val(data.Comment);
                        CKEDITOR.replace('txtComment');
                    } else {
                        var template = $('#commentSubmissionItem').html();
                        var html = '';

                        html += Mustache.render(template, {
                            ButtonUpdateCommentSubmission: (config.lecturerId == lecturerId) ? (
                            '<button id="btnUpdateCommentSubmission" data-id="' + data.Id + '" class="btn btn-primary btn-icon-split mb-2">' +
                                '<span class="icon text-white-50">' +
                                    '<i class="fas fa-edit"></i>' +
                                '</span>' +
                                '<span class="text">' + (data.Comment == null ? 'Thêm mới nhận xét' : 'Cập nhật nhận xét') + '</span>' +
                            '</button>' ) : '',

                            ButtonDeleteCommentSubmission: (data.Comment != null && config.lecturerId == lecturerId) ? (
                            '<button id="btnDeleteCommentSubmission" data-id="' + data.Id + '" class="btn btn-danger btn-icon-split mb-2">' +
                                '<span class="icon text-white-50">' +
                                    '<i class="fas fa-trash"></i>' +
                                '</span>' +
                                '<span class="text">Xoá nhận xét</span>' +
                            '</button>') : '',

                            CommentSubmission: (data.Comment == null ? '<div class="alert alert-danger mb-0">Chưa có nhận xét</div>' : data.Comment)
                        });

                        $('#commentSubmission').html(html);
                        projectDetailController.registerEvent();
                    }
                }
            }, 
            error: function () {

            }
        })
    },

    /* Save Comment */
    saveComment: function () {
        if ($('#frmCommentSubmission').valid()) {
            var id = $('#nbrProjectStageId').val();
            var comment = CKEDITOR.instances['txtComment'].getData();

            var model = {
                Id: id,
                Comment: comment
            };

            $.ajax({
                url: '/API/ProjectStage/Update',
                data: { model: model },
                type: 'POST',
                dataType: 'json',
                success: function (response) {
                    if (response.status) {
                        projectDetailController.loadComment(id);

                        $('#modal').modal('hide');

                        bootbox.alert({ message: 'Cập nhật nhận xét thành công!' });
                    } else {
                        bootbox.alert({ message: 'Cập nhật nhận xét không thành công!' });
                    }
                },
                error: function () {
                    bootbox.alert({ message: 'Cập nhật nhận xét không thành công!' });
                }
            })
        }
    },

    /* Delete Comment */
    deleteComment: function (id) {
        var model = { Id: id, Comment: 'Delete' };
        var link = '/API/ProjectStage/Update';

        $.ajax({
            url: link,
            data: { model: model },
            type: 'POST',
            dataType: 'json',
            success: function (response) {
                if (response.status) {
                    $('#modal').modal('hide');
                    projectDetailController.loadComment(id);

                    bootbox.alert({ message: 'Xoá nhận xét giai đoạn thành công!' })
                } else {
                    bootbox.alert({ message: 'Xoá nhận xét giai đoạn không thành công!' })
                }
            },
            error: function () {
                bootbox.alert({ message: 'Xoá nhận xét giai đoạn không thành công!' })
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
                    projectDetailController.registerEvent();

                    return;
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
                        projectDetailController.loadProject();
                        projectDetailController.loadAssembly(id);

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

projectDetailController.init();
// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery3
//= require jquery_ujs
//= require jquery-ui/widgets/sortable

//= require datatables

//= require bootstrap-sprockets
//= require adminlte
//= require cocoon

//= require select2-full
//= require select2_locale_pt-BR
//= require jquery.mask
//= require chosen-jquery

//= require moment
//= require bootstrap-datetimepicker

//= require wellcome
//= require Chart

//= require rails-ujs
//= require_tree .

function select_item(link) {
    val = $(link).parent().find("input").val()
    if (val == 'true') {
        $(link).parent().find("input").val('false');
        $(link).text('Remover');
        $(link).removeClass('btn-success');
        $(link).addClass('btn-danger');
        $(link).parent().next().find('input').removeClass('hidden');
        $(link).parent().next().next().find('input').removeClass('hidden');
    } else {
        $(link).parent().find("input").val('true');
        $(link).text('Selecionar');
        $(link).addClass('btn-success');
        $(link).removeClass('btn-danger');
        $(link).parent().next().find('input').addClass('hidden');
        $(link).parent().next().next().find('input').addClass('hidden');
    }
}

function add_select_2_field(element) {
    if (element) {
        var $element = element;
    } else {
        var $element = $(".select2-field");
    }

    $element.select2({
        theme: 'bootstrap',
        tags: true,
        tokenSeparators: [',', ' '],
        createTag: function (params) {
            var term = $.trim(params.term);

            if (term === '') {
                return null;
            }
            return {
                id: params.term,
                text: params.term,
                newTag: true
            }
        },
        insertTag: function (data, tag) {
            // Insert the tag at the end of the results
            data.push(tag);
        },
        minimumInputLength: 1,
        maximumInputLength: 20

    });
    $element.on("select2:select", function (e) {
        // $.ajax({
        //     type: "POST",
        //     url: $element.data('endpoint')
        // }).done(function(json) {
        //     $("#occurrence_city").html("");
        //     $("#occurrence_city").html("<option value=''></option>");
        //     $.each(json, function(key, value) {
        //         $('#occurrence_city').append($("<option></option>")
        //             .attr("value", value.id).text(value.name));
        //     });
        // });
    });

}

function preload_tags(tags_url, element) {
    if (element) {
        var $element = element;
    } else {
        var $element = $(".select2-field");
    }
    $.ajax({
        type: 'GET',
        url: tags_url
    }).then(function (data) {

        data.forEach(add_tag);

        function add_tag(value, index, ar) {
            // create the option and append to Select2
            var option = new Option(value.name, value.name, true, true);
            $element.append(option).trigger('change');
        }

        // manually trigger the `select2:select` event
        $element.trigger({
            type: 'select2:select',
            params: {
                data: data
            }
        });
    });
}

function add_select2(element) {
    if (element) {
        var $element = element;
    } else {
        var $element = $(".select2");
    }
    $element.select2({
        placeholder: "Escolha uma opção",
        language: "pt-BR",
        theme: "bootstrap",
        allowClear: false
    });
}

function toggle_collapse(element) {
    if (element) {
        $(element).next().collapse('toggle');
    }
}

function add_chosen(element) {
    var $element;
    if (element) {
        $element = element;
    } else {
        $element = $(".chzn-select-multi");
    }
    $element.attr("multiple", "multiple");

    $element.chosen({
        allow_single_deselect: true,
        width: '100%'
    });
}

function add_datetimepicker(element) {
    var $element;
    if (element) {
        $element = element;
    } else {
        $element = $(".form_datetime");
    }
    console.log("datetimepicker: ", $element);
    $element.datetimepicker({
        format: 'dd-mm-yyyy hh:ii',
        pickerPosition: "bottom-left"
    });
}

$(document).ready(function () {
    $('input[id$=cpf]').mask('000.000.000-00');

    $('[data-toggle="tooltip"]').tooltip();

    add_select2();
    add_select_2_field();
    add_chosen();
    add_datetimepicker();

    $('.datatables').DataTable({
        paging: false,
        searching: false,
        ordering: false,
        info: false,
        responsive: true,
        language: {
            "sEmptyTable": "Nenhum registro encontrado",
            "sInfo": "Mostrando de _START_ até _END_ de _TOTAL_ registros",
            "sInfoEmpty": "Mostrando 0 até 0 de 0 registros",
            "sInfoFiltered": "(Filtrados de _MAX_ registros)",
            "sInfoPostFix": "",
            "sInfoThousands": ".",
            "sLengthMenu": "_MENU_ resultados por página",
            "sLoadingRecords": "Carregando...",
            "sProcessing": "Processando...",
            "sZeroRecords": "Nenhum registro encontrado",
            "sSearch": "Pesquisar",
            "oPaginate": {
                "sNext": "Próximo",
                "sPrevious": "Anterior",
                "sFirst": "Primeiro",
                "sLast": "Último"
            },
            "oAria": {
                "sSortAscending": ": Ordenar colunas de forma ascendente",
                "sSortDescending": ": Ordenar colunas de forma descendente"
            }
        }
    });

    $('#partnership_boxes').on('cocoon:after-insert', function (e, insertedItem) {
        var $element = $(insertedItem.find('select'));
        add_select2($element);
        $('.collapse').collapse('hide');
        insertedItem.find('.collapse').last().collapse('show');
    });
    $('#stage_boxes').on('cocoon:after-insert', function (e, insertedItem) {
        $('.collapse').collapse('hide');
        insertedItem.find('.collapse').last().collapse('show');
    });
    $('#event_item_boxes').on('cocoon:after-insert', function (e, insertedItem) {
        var $element = $(insertedItem.find('.form_datetime'));
        add_datetimepicker($element);
        $('.collapse').collapse('hide');
        insertedItem.find('.collapse').last().collapse('show');
    });
    $('#coupom_boxes').on('cocoon:after-insert', function (e, insertedItem) {
        $('.collapse').collapse('hide');
        insertedItem.find('.collapse').last().collapse('show');
    });
    $('#moderator_boxes').on('cocoon:after-insert', function (e, insertedItem) {
        var $element = $(insertedItem.find('select'));
        add_select2($element);
        $('.collapse').collapse('hide');
        insertedItem.find('.collapse').last().collapse('show');
    });

});
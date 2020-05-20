$(document).ready(function(){
    //search example
    $('.example_btn_pop').click(function(){
        const examples = "Zm00001d005057,Zm00001d024009,Zm00001d049223,Zm00001d025661,Zm00001d019605,Zm00001d002425,Zm00001d033005,Zm00001d047463,Zm00001d021685,Zm00001d051863,Zm00001d046861,Zm00001d037010";
        $('#edit-geneids').val(examples);
        return false;   // this prevents a submit form event 
    });
    $('.example_btn_ref').click(function(){
        const examples = "Zm00015a000003, Zm00015a000005, Zm00015a000008, Zm00015a000009, Zm00015a000011, Zm00015a000012, Zm00015a000021, Zm00015a000023";
        $('#edit-geneids').val(examples);
        return false;   // this prevents a submit form event 
    });

    //show selected category tissues
    var category = $('#edit-select-category').val();
    if(category && category != 'All'){
        var select_div = '.form-item-' + category;
        $('.form-type-checkboxes').hide();
        $(select_div).show();
    } else {
        $('.form-type-checkboxes').show();
    }

    //category tissues hide or show event
    $('#edit-select-category').change(function(){
        $('input[type="checkbox"]').prop('checked', false);
        var category = $(this).children('option:selected').val();
        if(category != 'All'){
            var select_div = '.form-item-' + category;
            $('.form-type-checkboxes').hide();
            $(select_div).show();
        } else {
            $('.form-type-checkboxes').show();
        }
    });

    //check all checkbox
    selectAll_label = $('.form-type-checkboxes label:first-child'); 
    selectAll_label.each(function(){
        label_category = $(this).text().toLowerCase().trim();
        id = 'select_' + label_category;
        input_selectAll = '<input type="checkbox" class="selectAll_checkbox" id="' + id + '" />';
        $(this).after(input_selectAll);
        $(this).attr('for', id);
        $(this).attr('class', 'selectAll_label');
        id = '#' + id;
        $(id).change(function(){
            select_inputs = $(this).nextAll().filter('div').find('input[type="checkbox"]');
            select_inputs.prop('checked', $(this).prop('checked'));
        });  
    });
});

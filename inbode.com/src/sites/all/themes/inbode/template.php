<?php


function inbode_theme(&$existing, $type, $theme, $path) {
  $hooks = zen_theme($existing, $type, $theme, $path);
  // Add your theme hooks like this:
  /*
  $hooks['hook_name_here'] = array( // Details go here );
  */
  // @TODO: Needs detailed comments. Patches welcome!
  return $hooks;
}


function phptemplate_preprocess_page(&$vars) {
  if (module_exists('path')) {
    $alias = drupal_get_path_alias(str_replace('/edit','',$_GET['q']));
    if ($alias != $_GET['q']) {
      $suggestions = array();
      $template_filename = 'page';
      foreach (explode('/', $alias) as $path_part) {
        $template_filename = $template_filename . '-' . $path_part;
        $suggestions[] = $template_filename;
      }
      $vars['template_files'] = array_merge($vars['template_files'],(array) $suggestions);
      if ($vars['node']->type != "") {
        array_unshift($vars['template_files'], "page-nodetype-" . $vars['node']->type);
      } 
    }
  }
}



function inbode_form_element($element, $value) {
  // This is also used in the installer, pre-database setup.
  $t = get_t();

  $output = '<div class="form-item"';
  if (!empty($element['#id'])) {
    $output .= ' id="'. $element['#id'] .'-wrapper"';
  }
  $output .= ">\n";
  $required = !empty($element['#required']) ? '<span class="form-required" title="'. $t('This field is required.') .'">*</span>' : '';

  if (!empty($element['#title'])) {
    $title = $element['#title'];
    if (!empty($element['#id'])) {
      $output .= ' <label for="'. $element['#id'] .'">'. $t('!title !required', array('!title' => filter_xss_admin($title), '!required' => $required)) ."</label>\n";
    }
    else {
      $output .= ' <label>'. $t('!title !required', array('!title' => filter_xss_admin($title), '!required' => $required)) ."</label>\n";
    }
  }

  $output .= " $value\n";

  if (!empty($element['#description'])) {
    $output .= ' <div class="description">'. $element['#description'] ."</div>\n";
  }

  $output .= "</div>\n";

  return $output;
}


/**
 * Theme function for the swfupload form element
 */
function inbode_swfupload_widget($element) {
  drupal_add_css(drupal_get_path('module', 'swfupload') .'/swfupload.css');

  // Force the classes swfupload_button and disabled to be added to the button
  _form_set_class($element, array('swfupload_button', 'disabled'));
  $element['#attributes']['class'] = str_replace(' error', ' swfupload-error', $element['#attributes']['class']);

  $title = ($element['#title']) ? $element['#title'] : t('Upload new !file', array('!file' => ($element['#max_files'] > 1 ? t('file(s)') : t('file'))));

// starts a div before the table, the closing tags is added via jQuery
  $output[] = '<div class="table_wrap">';
  $output[] = ' <div id="'. $element['#id'] .'" '. drupal_attributes($element['#attributes']) .'>';
  $output[] = '  <div class="swfupload-wrapper">';
  $output[] = '    <div id="'. $element['#name'] .'-swfwrapper">&nbsp;</div>';
  $output[] = '  </div>';
  $output[] = '  <div class="left">&nbsp;</div>';
  $output[] = '  <div class="center">'. $title .'</div>';
  $output[] = '  <div class="right">&nbsp;</div><br />';
  $output[] = ' </div>';
  $output[] = '</div>';
  if ($element['#description']) {
    $output[] = '  <div class="description">'. $element['#description'] .'</div>';
  }
  return join("\n", $output);
}

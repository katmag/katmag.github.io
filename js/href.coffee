---
---
jQuery ($) ->
    if !window.location.origin
        window.location.origin = window.location.protocol + "//" + window.location.hostname + (if window.location.port then ':' + window.location.port else '');
    $('a[href^="http"]').attr('target', '_blank');
    $('a[href^="//"]').attr('target', '_blank');
    $('a[href^="' + window.location.origin + '"]').attr('target', '_self');
    return

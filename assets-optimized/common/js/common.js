/**
 * JavaScript commun à toutes les marques - Raleyan Concept Store
 */

$(document).ready(function() {
    
    // Configuration commune pour tous les sliders Owl Carousel
    var owlConfig = {
        loop: true,
        margin: 10,
        nav: true,
        autoplay: true,
        autoplayTimeout: 5000,
        responsive: {
            0: { items: 1 },
            600: { items: 2 },
            1000: { items: 3 }
        }
    };
    
    // Configuration commune pour le mobile menu
    var mobileMenuConfig = {
        extensions: ["pagedim-black"],
        navbar: {
            title: "Menu"
        },
        offCanvas: {
            position: "left",
            zposition: "front"
        }
    };
    
    // Initialisation du menu mobile s'il existe
    if ($(".mobile-menu").length) {
        $(".mobile-menu").mmenu(mobileMenuConfig);
    }
    
    // Gestion du preloader
    $(window).on('load', function() {
        $("#preloader").fadeOut(500);
    });
    
    // Smooth scrolling pour les ancres
    $('a[href*="#"]:not([href="#"])').click(function() {
        if (location.pathname.replace(/^\//, '') == this.pathname.replace(/^\//, '') 
            && location.hostname == this.hostname) {
            var target = $(this.hash);
            target = target.length ? target : $('[name=' + this.hash.slice(1) + ']');
            if (target.length) {
                $('html, body').animate({
                    scrollTop: target.offset().top - 70
                }, 1000);
                return false;
            }
        }
    });
    
    // Animation des compteurs si présents
    $('.counter').each(function() {
        var $this = $(this),
            countTo = $this.attr('data-count');
        
        $({ countNum: $this.text()}).animate({
            countNum: countTo
        }, {
            duration: 2000,
            easing: 'linear',
            step: function() {
                $this.text(Math.floor(this.countNum));
            },
            complete: function() {
                $this.text(this.countNum);
            }
        });
    });
    
    // Configuration AJAX commune
    $.ajaxSetup({
        cache: false,
        timeout: 10000
    });
    
});

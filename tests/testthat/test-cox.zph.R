if( require("survival", quietly = TRUE) ) {
    
    # from `help("cox.zph")`
    fit <- coxph(Surv(futime, fustat) ~ age + ecog.ps, data=ovarian)
    zph <- cox.zph(fit)
    
    tidy_names <- c("term", "rho", "statistic", "p.value")
    glance_names <- c("statistic", "p.value")
    
    context("Testing tidy() on cox.zph objects")
    
    test_that("tidy.cox.zph works", {
        td <- tidy(zph)
        check_tidy(td, exp.names=tidy_names)
    })
    
    
    
    
    
    
    context("Testing glance() on cox.zph objects")
    
    
    test_that("glance.cox.zph works", {
        gl <- glance(zph)
        check_tidy(gl, exp.names=glance_names)
    })
    
    
}

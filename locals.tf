locals {
    tags = {
        Name = "${var.project}-${var.environment}"
        environment = var.environment
        terraform = "true"
    }
    vpc_final_tags = merge(
        local.tags,
        var.vpc_tags
    )
    
}
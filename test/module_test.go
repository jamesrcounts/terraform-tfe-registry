package test

import (
	"testing"

	"github.com/gruntwork-io/terratest/modules/terraform"
	// "github.com/stretchr/testify/assert"
)

func TestWorkspace(t *testing.T) {
	terraformOptions := terraform.WithDefaultRetryableErrors(t, &terraform.Options{
		TerraformDir: "../examples/default",
	})

	defer terraform.Destroy(t, terraformOptions)

	terraform.InitAndApply(t, terraformOptions)

	// TFE provider doesn't provide a data source for modules today, figure out how to
	// use the API to validate.
}

package test

import (
	"strings"
	"testing"

	"github.com/gruntwork-io/terratest/modules/terraform"
	"github.com/stretchr/testify/assert"
)

func TestWorkspace(t *testing.T) {
	terraformOptions := terraform.WithDefaultRetryableErrors(t, &terraform.Options{
		TerraformDir: "../examples/default",
	})

	defer terraform.Destroy(t, terraformOptions)

	terraform.InitAndApply(t, terraformOptions)

	actualName := terraform.Output(t, terraformOptions, "name")
	actualOauthUrl := terraform.Output(t, terraformOptions, "oauth_http_url")

	assert.True(t, strings.HasPrefix(actualName, "org-test"))
	assert.Equal(t, "https://github.com", actualOauthUrl)
}

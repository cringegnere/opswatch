require 'aws-sdk'

class AwsPoller
  def initialize(params)
    credentials = Aws::Credentials.new(params['iam_user'], params['iam_secret'])
    @client = Aws::OpsWorks::Client.new(region: params['region'], credentials: credentials)
    @stack_id = params['stack_id']
  end

  def poll
    ret = {}
    begin
      stack_resp = @client.describe_stack_summary(stack_id: @stack_id)
      deploy_resp = @client.describe_deployments(stack_id: @stack_id).deployments.first
      ret[:online] = stack_resp.stack_summary.instances_count.online
      ret[:running_setup] = stack_resp.stack_summary.instances_count.running_setup
      ret[:setup_failed] = stack_resp.stack_summary.instances_count.setup_failed
      ret[:start_failed] = stack_resp.stack_summary.instances_count.start_failed
      ret[:deploy_state] = deploy_resp.status
      ret
    rescue StandardError
      ret[:exception] = true
      ret
    end
  end
end

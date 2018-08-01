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
      resp = @client.describe_stack_summary(stack_id: @stack_id)
      ret[:online] = resp.stack_summary.instances_count.online
      ret[:running_setup] = resp.stack_summary.instances_count.running_setup
      ret[:setup_failed] = resp.stack_summary.instances_count.setup_failed
      ret[:start_failed] = resp.stack_summary.instances_count.start_failed
      ret
    rescue StandardError
      ret[:exception] = true
      ret
    end
  end
end

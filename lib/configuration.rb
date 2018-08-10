module Opswatch
  class Configuration
    def self.load_file(filename)
      local_path = "#{GEM_ROOT}/#{filename}"
      global_path = File.join(ENV['HOME'], filename)
      if File.exist?(local_path)
        YAML.load_file(local_path)
      elsif File.exist?(global_path)
        YAML.load_file(global_path)
      else
        create_configuration
      end
    end

    def self.create_configuration
      settings = {}
      continue = true
      puts "Let's set things up"

      while continue
        puts 'Stack Name (can be anything):'
        name = gets.chomp
        puts 'Region (e.g. eu-central-1):'
        region = gets.chomp
        puts 'IAM User key:'
        iam_user = gets.chomp
        puts 'IAM User secret:'
        iam_secret = gets.chomp
        puts 'OpsWorks Stack ID:'
        stack_id = gets.chomp

        settings[name] = { 'region' => region,
                           'iam_user' => iam_user,
                           'iam_secret' => iam_secret,
                           'stack_id' => stack_id }

        puts 'Insert other Stack? (Y/n)'
        continue = gets.chomp != 'n'
      end

      File.write(File.join(ENV['HOME'], '.opswatch.yml'), settings.to_yaml)
      settings
    end
  end
end

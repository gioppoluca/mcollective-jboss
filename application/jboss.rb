class MCollective::Application::Jboss<MCollective::Application
    description "Calls the CLI of JBoss AS"

    option :user,
           :description    => "CLI user",
           :arguments      => ["-u", "--user USER"],
           :type           => String,
           :required       => true

    option :password,
          :description    => "CLI user password",
          :arguments      => ["-p", "--password PASSWORD"],
          :type           => String,
          :required       => true

	option :command,
          :description    => "Command to execute",
          :arguments      => ["-cm", "--command COMMAND"],
          :type           => String,
          :required       => true
   def main
      mc = rpcclient("echo")
	  mc.progress = false
      printrpc mc.cli(:cli_user => configuration[:user], :cli_pwd => configuration[:password], :options => options)

      printrpcstats
	  halt mc.stats
   end
end
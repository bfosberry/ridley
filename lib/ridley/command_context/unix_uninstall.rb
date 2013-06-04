module Ridley
  module CommandContext
    # Context class for generating an uninstall command for Unix based OSes
    class UnixUninstall < CommandContext::Unix
      template_file 'unix_uninstall_omnibus'

      # @return [Boolean]
      attr_reader :skip_chef

      # @option options [Boolena] :skip_chef (false)
      #   skip removal of the Chef package and the contents of the installation
      #   directory. Setting this to true will only remove any data and configurations
      #   generated by running Chef client.
      def initialize(options = {})
        super(options)
        options    = options.reverse_merge(skip_chef: false)
        @skip_chef = options[:skip_chef]
      end

      # The path to the Chef configuration directory on the target host
      #
      # @return [String]
      def config_directory
        "/etc/chef"
      end

      # The path to the Chef data directory on the target host
      # @return [String]
      def data_directory
        "/var/chef"
      end

      # The path to the Omnibus Chef installation on the target host
      # @return [String]
      def install_directory
        "/opt/chef"
      end
    end
  end
end

module Gitlab
  module ChatCommands
    class IssueCreate < BaseCommand
      def self.match(text)
        /\Aissue\s+create\s+(?<title>[^\n]*)\n*(?<description>.*)\z/.match(text)
      end

      def execute(match)
        title = match[:title]
        description = match[:description]

        present Issues::CreateService.new(project, current_user, title: title, description: description).execute
      end
    end
  end
end

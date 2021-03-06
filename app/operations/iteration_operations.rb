module IterationOperations
  class Read
    def self.call(*args)
      new(*args).run
    end

    def initialize(start_date:, end_date:, project:)
      @start_date = start_date
      @end_date = end_date
      @project = project
    end

    def run
      {
        stories: past_iteration.stories
      }
    end

    private

    attr_reader :project, :start_date, :end_date

    def past_iteration
      Iterations::PastIteration.new(
        start_date: start_date,
        end_date: end_date,
        stories: stories
      )
    end

    def stories
      @stories ||= begin
        project
          .stories
          .with_dependencies
          .accepted_between(start_date, end_date)
      end
    end
  end
end

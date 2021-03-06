module Factories
  STORY_TRAITS = {
    unread: -> { { is_read: false } }
  }.freeze

  def create_story(*traits, **params)
    build_story(*traits, **params).tap(&:save!)
  end

  def build_story(*traits, **params)
    traits.each { |trait| params.merge!(STORY_TRAITS.fetch(trait).call) }

    Story.new(entry_id: next_id, feed: build_feed, **params)
  end
end

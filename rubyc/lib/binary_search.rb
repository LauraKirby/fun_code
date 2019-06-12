require 'byebug'
#
# We are going to build a system to help track the contents of a trailer (think 18 wheeler) and calculate the weight of the trailer over time.
# - Trailers can hold pallets.
# - A pallet has a weight, and a unique pallet ID.
# - Pallets can be loaded and unloaded from trailers.

# Part 1
# Create a Pallet class (or object) that represents a pallet with a weight and a unique id.

# Part 2

# Create a Trailer class that can hold multiple pallets.
# Write load(pallet) and unload(id) functions that support loading and unloading pallets from the trailer.
# Unload should remove the pallet from the trailer and return the pallet object back to the caller.

# Part 3
# Add a method weight() that returns the total weight of the pallets on the trailer.

# Part 4
# Create a method weightAt(t) that returns the weight of the pallets
# in the trailer at an arbitrary time. Modify the current class and
# methods as necessary to be able to answer this question.

class Trailer
  attr_reader :pallets, :weight, :weight_timeline

  def initialize
    @pallets = {}
    @weight = 0
    @weight_timeline = {}
  end

  def load_pallet(pallet, timestamp)
    @pallets[pallet.id] = pallet
    @weight += pallet.weight
    @weight_timeline[timestamp] = @weight

    return false if @pallets[pallet.id].nil?

    true
  end

  def unload_pallet(pallet_id, timestamp)
    unloaded_pallet = @pallets.delete(pallet_id)
    if unloaded_pallet
      @weight -= unloaded_pallet.weight
      @weight_timeline[timestamp] = @weight
    end

    unloaded_pallet
  end

  def weight_at(timestamp)
    return 'no weights have been recorded' if @weight_timeline.keys.empty?

    # timestamp is found
    return @weight_timeline[timestamp] if @weight_timeline[timestamp]

    # timestamp received occurred before all recorded timestamps
    return 0 if @weight_timeline.keys.first > timestamp

    # timestamp received occurred after all recorded timestamps
    return @weight_timeline[@weight_timeline.keys.last] if @weight_timeline.keys.last < timestamp

    # timestamp falls between two recorded timestamps
    return weight_for_nearest_timestamp(timestamp) if !@weight_timeline[timestamp]

    @weight_timeline[timestamp]
  end

  def binary_search(timestamp)
    timeline_keys = @weight_timeline.keys

    first_index = 0
    last_index = @weight_timeline.keys.length - 1
    middle_index = first_index + last_index / 2

    while first_index < last_index
      if timestamp > timeline_keys[middle_index] && timestamp < timeline_keys[middle_index + 1]
        timeline_key = timeline_keys[middle_index]
        return timeline_key

      # look right
      elsif timestamp > timeline_keys[middle_index]
        # only look at second half of array
        first_index = middle_index + 1
        middle_index = first_index + last_index / 2

      # look left
      elsif timestamp < timeline_keys[middle_index]
        # only look at first half of array
        last_index = middle_index
        middle_index = first_index + last_index / 2
      end
    end
  end

  def weight_for_nearest_timestamp(timestamp)
    timeline_key = binary_search(timestamp)
    @weight_timeline[timeline_key]
  end
end

class Pallet
  attr_reader :id, :weight

  def initialize(id, weight)
    @id = id
    @weight = weight
  end
end



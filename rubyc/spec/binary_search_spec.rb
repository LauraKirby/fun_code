require '_spec_helper'

describe 'binary search' do
  let(:timestamp) { 1_560_274_556_158 }

  describe Pallet do
    let(:pallet) { Pallet.new(1, 50) }

    describe 'attributes' do
      it "has 'id'" do
        expect(pallet.id).to be(1)
      end

      it "has 'weight'" do
        expect(pallet.weight).to be(50)
      end
    end
  end

  describe Trailer do
    describe 'attributes' do
      let(:trailer) { Trailer.new }

      it "has 'pallets'" do
        expect(trailer.pallets).to match({})
      end

      it "has 'weight'" do
        expect(trailer.weight).to be(0)
      end

      it "has 'weight_timeline'" do
        expect(trailer.weight_timeline).to match({})
      end
    end

    describe '#load_pallet' do
      let(:trailer) { Trailer.new }
      let(:pallet) { Pallet.new(1, 50) }

      it "returns 'true' when a Pallet was added" do
        load_success = trailer.load_pallet(pallet, timestamp)

        expect(load_success).to be(true)
      end

      it "adds an instance of Pallet to the 'pallets' attribute" do
        trailer.load_pallet(pallet, timestamp)
        pallets = trailer.pallets

        expect(pallets.keys.length).to eq(1)
      end
    end

    describe '#unload_pallet' do
      let(:trailer) { Trailer.new }
      let(:pallet) { Pallet.new(1, 50) }

      context 'pallet is present' do
        it 'returns an instance of Pallet' do
          trailer.load_pallet(pallet, timestamp)
          deleted_pallet = trailer.unload_pallet(pallet.id, timestamp)

          expect(deleted_pallet.class).to match(Pallet)
        end

        it 'returns the instance of Pallet that was removed' do
          trailer.load_pallet(pallet, timestamp)
          deleted_pallet = trailer.unload_pallet(pallet.id, timestamp)

          expect(deleted_pallet.id).to eq(pallet.id)
        end

        it "removes the Pallet from the 'pallets' attribute" do
          trailer.load_pallet(pallet, timestamp)
          trailer.unload_pallet(pallet.id, timestamp)

          expect(trailer.pallets[pallet.id]).to eq(nil)
        end
      end

      context 'pallet is not present' do
        it "returns 'nil'" do
          fake_pallet_id = 5
          deleted_pallet = trailer.unload_pallet(fake_pallet_id, timestamp)

          expect(deleted_pallet).to eq(nil)
        end
      end
    end

    describe '#weight_at' do
      let(:pallets) do
        [Pallet.new(2, 52), Pallet.new(4, 54), Pallet.new(6, 56)]
      end
      let(:timestamp) { 0 }
      let(:trailer) do
        t = Trailer.new
        tmstmp = 0
        pallets.each { |pallet| t.load_pallet(pallet, tmstmp += 2) }
        t
      end

      context "no available timestamps in 'weight_timeline'" do
        it 'returns an error message' do
          temp_trailer = Trailer.new
          timestamp = 3
          error_message = 'no weights have been recorded'

          expect(temp_trailer.weight_at(timestamp)).to eq(error_message)
        end
      end

      context "timestamp is present in 'weight_timeline" do
        it 'returns the sum of weight for timestamp' do
          pallet = pallets[0]
          timestamp = 2

          expect(trailer.weight_at(timestamp)).to eq(pallet.weight)
        end

        it 'returns the sum of weight for timestamp' do
          pallet_weight = pallets[0].weight + pallets[1].weight
          timestamp = 4

          expect(trailer.weight_at(timestamp)).to eq(pallet_weight)
        end
      end

      context 'timestamp is lower than all recorded timestamps' do
        it 'returns 0' do
          timestamp = 1

          expect(trailer.weight_at(timestamp)).to eq(0)
        end
      end

      context 'timestamp is greater than all recorded timestamps' do
        it 'returns last recorded weight' do
          last_recorded_weight = trailer.weight_timeline[trailer.weight_timeline.keys.last]
          timestamp = 100

          expect(trailer.weight_at(timestamp)).to eq(last_recorded_weight)
        end
      end

      context 'timestamp falls between two recorded timestamps' do
        it 'returns the weight matching the lower timestamp' do
          time_btwn_2_and_4 = 3
          sum_first_pallet = 52

          expect(trailer.weight_at(time_btwn_2_and_4)).to eq(sum_first_pallet)
        end

        it 'returns the weight matching the lower timestamp' do
          time_btwn_4_and_6 = 5
          sum_first_two_pallets = 106

          expect(trailer.weight_at(time_btwn_4_and_6)).to eq(sum_first_two_pallets)
        end
      end

      context 'after #unload_pallet' do
        it 'returns updated weight' do
          sum_weight = pallets[0].weight + pallets[1].weight
          timestamp = 6
          trailer.unload_pallet(pallets[2].id, timestamp)

          expect(trailer.weight_at(timestamp)).to eq(sum_weight)
        end
      end

      context 'after #load_pallet' do
        it 'returns updated weight' do
          sum_weight = pallets[0].weight + pallets[1].weight + pallets[2].weight
          pallet = Pallet.new(8, 58)
          timestamp = 8
          trailer.load_pallet(pallet, timestamp)
          sum_weight += pallet.weight

          expect(trailer.weight_at(timestamp)).to eq(sum_weight)
        end
      end
    end
  end
end

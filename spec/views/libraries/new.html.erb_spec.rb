  describe "new" do

    describe "library" do

      before { visit new_library_path  }

      let(:submit) { "Save" }

      describe "with invalid information" do
        it "should not create a library" do
          expect { click_button submit }.not_to change(Library, :count)
        end
      end

      describe "with valid information" do
        before do
          fill_in "Name", with: "Example Library"
        end

        it "should create a library" do
          expect { click_button submit }.to change(Library, :count).by(1)
        end
      end
    end
  end

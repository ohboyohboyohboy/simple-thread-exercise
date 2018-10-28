RSpec.describe SimpleThreadExercise::Models::ProjectSet do
  subject {
    SimpleThreadExercise::Models::ProjectSet.new(
      name:     "XYZ Projects",
      projects: [
        {
          name:       "website A",
          start: "2018/10/1",
          end:   "2018/10/2",
        },
        {
          name:       "website B",
          start: "2018/10/2",
          end:   "2018/10/3",
        },
        {
          name:       "website C",
          start: "2018/10/6",
          end:   "2018/10/6",
        },
      ]
    )
  }

  it "has a name" do
    expect(subject.name).to_not be_empty
  end
end

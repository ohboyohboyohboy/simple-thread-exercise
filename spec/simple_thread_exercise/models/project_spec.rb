RSpec.describe SimpleThreadExercise::Models::Project do
  subject {
    SimpleThreadExercise::Models::Project.new(
      name: "elephants",
      start: "2018/10/1",
      end: "2018/10/2"
    )
  }

  it "has a name" do
    expect(subject.name).to_not be_empty
  end

  it "has a start date" do
    expect(subject.start).to be_a Date
  end

  it "has an end date" do
    expect(subject.end).to be_a Date
  end
end

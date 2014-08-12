class DropDownUploadHierarchy < ActiveRecord::Migration
  def self.up

  	c1 = Category.create(:type_of_note => "Professional Exam Notes")
  	c2 = Category.create(:type_of_note => "Textbook Notes")
  	c3 = Category.create(:type_of_note => "Lecture Notes")

  	f1 = Fields.create(:field_name => "Finance", :category_id => c1.id)
  	f2 = Fields.create(:field_name => "Accounting", :category_id => c1.id)
  	f3 = Fields.create(:field_name => "Legal", :category_id => c1.id)
  	f4 = Fields.create(:field_name => "Medical", :category_id => c1.id)
  	f5 = Fields.create(:field_name => "Legal", :category_id => c2.id)
  	f6 = Fields.create(:field_name => "Accounting/Finance", :category_id => c2.id)
  	f7 = Fields.create(:field_name => "Medical", :category_id => c2.id)
  	f8 = Fields.create(:field_name => "Social Sciences", :category_id => c2.id)
  	f9 = Fields.create(:field_name => "Humanities", :category_id => c2.id)
  	f10 = Fields.create(:field_name => "Arts", :category_id => c2.id)
  	f11 = Fields.create(:field_name => "STEM", :category_id => c2.id)
  	f12 = Fields.create(:field_name => "Natural Sciences", :category_id => c3.id)
  	f13 = Fields.create(:field_name => "Mathematics", :category_id => c3.id)
  	f14 = Fields.create(:field_name => "Engineering", :category_id => c3.id)
  	f15 = Fields.create(:field_name => "Humanities", :category_id => c3.id)
  	f16 = Fields.create(:field_name => "Social Sciences", :category_id => c3.id)
  	f17 = Fields.create(:field_name => "Arts", :category_id => c3.id)

  	q1 = Qualification.create(:qual => "CFA Level 1", :field_id => f1.id)
  	q2 = Qualification.create(:qual => "CFA Level 2", :field_id => f1.id)
  	q3 = Qualification.create(:qual => "CFA Level 3", :field_id => f1.id)

  	q4 = Qualification.create(:qual => "First Class", :field_id => f12.id)
  	q5 = Qualification.create(:qual => "First Class", :field_id => f13.id)
  	q6 = Qualification.create(:qual => "First Class", :field_id => f14.id)
  	q7 = Qualification.create(:qual => "First Class", :field_id => f15.id)
  	q8 = Qualification.create(:qual => "First Class", :field_id => f16.id)
  	q9 = Qualification.create(:qual => "First Class", :field_id => f17.id)

  	q4 = Qualification.create(:qual => "Upper Second Class", :field_id => f12.id)
  	q5 = Qualification.create(:qual => "Upper Second Class", :field_id => f13.id)
  	q6 = Qualification.create(:qual => "Upper Second Class", :field_id => f14.id)
  	q7 = Qualification.create(:qual => "Upper Second Class", :field_id => f15.id)
  	q8 = Qualification.create(:qual => "Upper Second Class", :field_id => f16.id)
  	q9 = Qualification.create(:qual => "Upper Second Class", :field_id => f17.id)

  	q4 = Qualification.create(:qual => "Second Class", :field_id => f12.id)
  	q5 = Qualification.create(:qual => "Second Class", :field_id => f13.id)
  	q6 = Qualification.create(:qual => "Second Class", :field_id => f14.id)
  	q7 = Qualification.create(:qual => "Second Class", :field_id => f15.id)
  	q8 = Qualification.create(:qual => "Second Class", :field_id => f16.id)
  	q9 = Qualification.create(:qual => "Second Class", :field_id => f17.id)






  end
end

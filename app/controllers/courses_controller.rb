class CoursesController < ActionController::Base

  def index
    render json: Course.all.map(&:basic_info);
  end

  def show
    render json: Course.find_by(id: params[:id]).basic_info;
  end

  def create
    spot = params['spot']

    course = Course.create!(
      name: spot['name'],
      lat: spot['lat'],
      lng: spot['lng']
    )

    lunch= params['lunch']

    Lunch.create!(
      course_id: course.id,
      name: lunch['name'],
      lat: lunch['lat'],
      lng: lunch['lng'],
      image_url: lunch['image_url']
    )

    cafe= params['cafe']

    Cafe.create!(
      course_id: course.id,
      name: cafe['name'],
      lat: cafe['lat'],
      lng: cafe['lng'],
      image_url: cafe['image_url']
    )
    dinner= params['dinner']

    Dinner.create!(
      course_id: course.id,
      name: dinner['name'],
      lat: dinner['lat'],
      lng: dinner['lng'],
      image_url: dinner['image_url']
    )

    render json: {
      id: course.id
    }
  end
end
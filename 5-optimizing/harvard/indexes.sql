CREATE INDEX "search_courses_by_semester_dept" ON "courses"("semester", "department", "number");

CREATE INDEX "search_courses_by_title" ON "courses"("title");

CREATE INDEX "search_enrollments_by_student" ON "enrollments"("student_id");

CREATE INDEX "search_enrollments_by_course" ON "enrollments"("course_id");

CREATE INDEX "search_satisfies_by_course" ON "satisfies"("course_id");
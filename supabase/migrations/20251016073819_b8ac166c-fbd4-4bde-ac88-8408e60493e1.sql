-- Add new columns to schools table
ALTER TABLE public.schools 
ADD COLUMN board text,
ADD COLUMN type text,
ADD COLUMN hostel_facility text;
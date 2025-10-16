-- Create schools table
CREATE TABLE public.schools (
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL,
  address TEXT NOT NULL,
  city TEXT NOT NULL,
  state TEXT NOT NULL,
  contact TEXT NOT NULL,
  image TEXT,
  email_id TEXT NOT NULL,
  created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

-- Enable Row Level Security
ALTER TABLE public.schools ENABLE ROW LEVEL SECURITY;

-- Create policies for schools table (public read, authenticated write for now)
CREATE POLICY "Anyone can view schools"
  ON public.schools
  FOR SELECT
  USING (true);

CREATE POLICY "Anyone can insert schools"
  ON public.schools
  FOR INSERT
  WITH CHECK (true);

-- Create storage bucket for school images
INSERT INTO storage.buckets (id, name, public)
VALUES ('school-images', 'school-images', true);

-- Storage policies for school images
CREATE POLICY "Anyone can view school images"
  ON storage.objects
  FOR SELECT
  USING (bucket_id = 'school-images');

CREATE POLICY "Anyone can upload school images"
  ON storage.objects
  FOR INSERT
  WITH CHECK (bucket_id = 'school-images');

CREATE POLICY "Anyone can update school images"
  ON storage.objects
  FOR UPDATE
  USING (bucket_id = 'school-images');
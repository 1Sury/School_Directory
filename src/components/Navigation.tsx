import { Link, useLocation } from "react-router-dom";
import { Button } from "@/components/ui/button";
import { GraduationCap } from "lucide-react";

const Navigation = () => {
  const location = useLocation();
  
  return (
    <nav className="border-b bg-card">
      <div className="container mx-auto px-4 py-4">
        <div className="flex items-center justify-between">
          <Link to="/" className="flex items-center gap-2">
            <GraduationCap className="h-8 w-8 text-primary" />
            <span className="text-xl font-bold">School Directory</span>
          </Link>
          
          <div className="flex gap-2">
            <Button
              asChild
              variant={location.pathname === "/add-school" ? "default" : "outline"}
            >
              <Link to="/add-school">Add School</Link>
            </Button>
            <Button
              asChild
              variant={location.pathname === "/" ? "default" : "outline"}
            >
              <Link to="/">View Schools</Link>
            </Button>
          </div>
        </div>
      </div>
    </nav>
  );
};

export default Navigation;

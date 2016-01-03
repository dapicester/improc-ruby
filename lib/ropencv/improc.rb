require 'ropencv'

module OpenCV
  module Cv
    class FileStorage
      def self.with(name, mode)
        fs = new name, mode
        yield fs
        fs.release
      end

      private

      def write_keypoint(kp)
        self << '{'
        self << 'x' << kp.pt.x
        self << 'y' << kp.pt.y
        self << 'size' << kp.size
        self << 'angle' << kp.angle
        self << 'response' << kp.response
        self << 'octave' << kp.octave
        self << 'class_id' << kp.class_id
        self << '}'
      end

      def write_cv_keypoint(vec)
        self << '['
        vec.each { |kp| self << kp }
        self << ']'
      end
    end

    class FileNode
      def >>(dest)
        type = dest.class.name.split("::").last.downcase
        send "read_#{type}", dest
      end

      private

      def read_cv_keypoint(dest)
        to_a.each do |fn|
          dest << Cv::KeyPoint.new(fn['x'].to_float,
                                   fn['y'].to_float,
                                   fn['size'].to_float,
                                   fn['angle'].to_float,
                                   fn['response'].to_float,
                                   fn['octave'].to_int,
                                   fn['class_id'].to_int)
        end
      end
    end
  end
end

% A convolution filter.

classdef Filter < handle
    
    properties (SetAccess = private)
        texture
    end
    
    properties (Access = private)
        kernel
    end
    
    methods
        
        % Constructs a filter from an M-by-N-by-1 convolution matrix (kernel). 
        function obj = Filter(kernel)
            if size(kernel, 3) ~= 1
                error('Kernel must be 2-dimensional');
            end
            
            obj.kernel = single(kernel);
        end
        
        function init(obj, canvas)            
            obj.texture = TextureObject(canvas, 2);
            obj.texture.setMinFilter(GL.NEAREST);
            obj.texture.setMagFilter(GL.NEAREST);
            obj.texture.setImage(obj.kernel);
        end
        
    end
    
end


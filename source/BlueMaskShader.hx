package;

import FlxShader;
import openfl.display.BitmapData;
import openfl.display.ShaderInput;
import openfl.utils.Assets;
import flixel.FlxG;
import openfl.Lib;

// wooo I made this :] -Neb

class BlueMaskShader extends FlxShader
{

  @:glFragmentSource('
    #pragma header
    uniform sampler2D mask;
    void main()
    {
    	vec2 uv = openfl_TextureCoordv;

    	vec4 base = flixel_texture2D(bitmap, uv);
      vec4 masktex = flixel_texture2D(mask, uv);
    	float alpha = 1.0 - (masktex.b * masktex.a);

    	gl_FragColor = vec4(base.rgb*vec3(alpha)*vec3(base.a), alpha*base.a);
    }

  ')
  public function new()
  {
    super();
  }
}

local nodes = {}
local players = {}

local torch_colors = {
	"#200",
	"#210",
	"#110",
	"#120",
	"#011"
}


minetest.register_abm({
	nodenames = { "default:torch" },
	interval = 1,
	chance = 1,
	catch_up = false,
	action = function(pos, node)
		local meta = minetest.get_meta(pos)
		local color = meta:get("colored_torch:color")
		if color == nil then
			color = torch_colors[math.floor(math.random() * #torch_colors) + 1]
			meta:set_string("colored_torch:color", color)
		end
		minetest.add_particlespawner({
			pos = { min = vector.add(pos, vector.new(-0.2, 0.35, -0.2)), max = vector.add(pos, vector.new(0.2, 0.45, 0.2)) },
			vel = { min = vector.new(0, 0, 0), max = vector.new( 0, 0, 0) },
			acc = { min = vector.new(0, 0.1, 0), max = vector.new(0, 0.3, 0) },
			time = 1,
			amount = 4,
			exptime = 1,
			collisiondetection = true,
			collision_removal = true,
			glow = 14,
			texpool = {
				{ name = "flame_spark.png^[multiply:"..color, blend = "screen", scale = 16 },
			}
		})
	end
})


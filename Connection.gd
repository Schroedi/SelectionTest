tool
extends MeshInstance2D


func _ready():
	if not Engine.is_editor_hint():
		return
	var st = SurfaceTool.new()
	st.begin(Mesh.PRIMITIVE_TRIANGLE_FAN)
	var p1 = Vector2(100, 100)
	var p2 = Vector2(20, 20)
	var norm = p1.direction_to(p2).rotated(0.5*PI)
	var w = 4 # line width
	var verts = [p1+norm*w, p1-norm*w, p2-norm*w, p2+norm*w]
	var uvs = [Vector2(1, 1), Vector2(1, 0), Vector2(0, 0), Vector2(0, 1)]
	for i in verts.size():
		var v = verts[i]
		st.add_uv(uvs[i])
		st.add_vertex(Vector3(v.x, v.y, 0))
	mesh = st.commit()

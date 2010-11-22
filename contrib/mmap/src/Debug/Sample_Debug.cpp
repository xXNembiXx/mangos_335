//
// Copyright (c) 2009-2010 Mikko Mononen memon@inside.org
//
// This software is provided 'as-is', without any express or implied
// warranty.  In no event will the authors be held liable for any damages
// arising from the use of this software.
// Permission is granted to anyone to use this software for any purpose,
// including commercial applications, and to alter it and redistribute it
// freely, subject to the following restrictions:
// 1. The origin of this software must not be misrepresented; you must not
//    claim that you wrote the original software. If you use this software
//    in a product, an acknowledgment in the product documentation would be
//    appreciated but is not required.
// 2. Altered source versions must be plainly marked as such, and must not be
//    misrepresented as being the original software.
// 3. This notice may not be removed or altered from any source distribution.
//

#define _USE_MATH_DEFINES
#include <math.h>
#include <stdio.h>
#include "Sample_Debug.h"
#include "InputGeom.h"
#include "pathfinding/Recast/Recast.h"
#include "pathfinding/Detour/DetourNavMesh.h"
#include "pathfinding/Recast/RecastLog.h"
#include "pathfinding/DebugUtils/RecastDebugDraw.h"
#include "pathfinding/DebugUtils/DetourDebugDraw.h"
#include "pathfinding/DebugUtils/RecastDump.h"
#include "imgui.h"
#include "SDL.h"
#include "SDL_opengl.h"

#include "NavMeshTesterTool.h"

#include "Debug.h"

#ifdef WIN32
#	define snprintf _snprintf
#endif

/*
static int loadBin(const char* path, unsigned char** data)
{
	FILE* fp = fopen(path, "rb");
	if (!fp) return 0;
	fseek(fp, 0, SEEK_END);
	int size = ftell(fp);
	fseek(fp, 0, SEEK_SET);
	*data = new unsigned char[size];
	fread(*data, size, 1, fp);
	fclose(fp);
	return size;
} 
*/

Sample_Debug::Sample_Debug() : Sample_SoloMeshTiled()
{
	resetCommonSettings();

    duReadNavMesh(30, m_navMesh);

	// Test
	//m_chf = new rcCompactHeightfield;
	//FileIO io;
	//if (!io.openForRead("test.chf"))
	//{
	//	delete m_chf;
	//	m_chf = 0;
	//}
	//else
	//{
	//	if (!duReadCompactHeightfield(*m_chf, &io))
	//	{
	//		delete m_chf;
	//		m_chf = 0;
	//	}
	//}
	
/*	if (m_chf)
	{
		unsigned short ymin = 0xffff;
		unsigned short ymax = 0;
		for (int i = 0; i < m_chf->spanCount; ++i)
		{
			const rcCompactSpan& s = m_chf->spans[i];
			if (s.y < ymin) ymin = s.y;
			if (s.y > ymax) ymax = s.y;
		}
		printf("ymin=%d ymax=%d\n", (int)ymin, (int)ymax);
		
		int maxSpans = 0;
		for (int i = 0; i < m_chf->width*m_chf->height; ++i)
		{
			maxSpans = rcMax(maxSpans, (int)m_chf->cells[i].count);
		}
		printf("maxSpans = %d\n", maxSpans);
	}*/
	

/*	const float orig[3] = {0,0,0};
	m_navMesh = new dtNavMesh;
	m_navMesh->init(orig, 133.333f,133.333f, 2048, 4096, 4096);

	unsigned char* data = 0;
	int dataSize = 0;
	
	// Tile_-13_-14.bin is basically just the bytes that was output by Detour. It should be loaded at X: -13 and Y: -14.
	
	dataSize = loadBin("Tile_-13_-13.bin", &data);
	if (dataSize > 0)
	{
		m_navMesh->addTileAt(-13,-13, data, dataSize, true);
		dtMeshHeader* header = (dtMeshHeader*)data;
		vcopy(m_bmin, header->bmin);
		vcopy(m_bmax, header->bmax);
	}

	dataSize = loadBin("Tile_-13_-14.bin", &data);
	if (dataSize > 0)
	{
		m_navMesh->addTileAt(-13,-14, data, dataSize, true);
	}

	dataSize = loadBin("Tile_-14_-14.bin", &data);
	if (dataSize > 0)
	{
		m_navMesh->addTileAt(-14,-14, data, dataSize, true);
	}
	
	const float ext[3] = {40,100,40};
	const float center[3] = { -1667.9491f, 135.52649f, -1680.6149f };
	dtQueryFilter filter;
	m_ref = m_navMesh->findNearestPoly(center, ext, &filter, 0);

	vcopy(m_ext, ext);
	vcopy(m_center, center);*/
}

Sample_Debug::~Sample_Debug()
{
    Sample_SoloMeshTiled::cleanup();
}

void Sample_Debug::handleSettings()
{
    Sample_SoloMeshTiled::handleSettings();
}

void Sample_Debug::handleTools()
{
    Sample_SoloMeshTiled::handleTools();
}

void Sample_Debug::handleDebugMode()
{
    Sample_SoloMeshTiled::handleDebugMode();
}

void Sample_Debug::handleRender()
{
    Sample_SoloMeshTiled::handleRender();

	//DebugDrawGL dd;
	
//	if (m_chf)
//	{
//		duDebugDrawCompactHeightfieldRegions(&dd, *m_chf);
////		duDebugDrawCompactHeightfieldSolid(&dd, *m_chf);
//	}
//		
//	if (m_navMesh)
//		duDebugDrawNavMesh(&dd, *m_navMesh, DU_DRAWNAVMESH_CLOSEDLIST|DU_DRAWNAVMESH_OFFMESHCONS);
//
//	if (m_ref && m_navMesh)
//		duDebugDrawNavMeshPoly(&dd, *m_navMesh, m_ref, duRGBA(255,0,0,128));
//
//	float bmin[3], bmax[3];
//	rcVsub(bmin, m_center, m_ext);
//	rcVadd(bmax, m_center, m_ext);
//	duDebugDrawBoxWire(&dd, bmin[0],bmin[1],bmin[2], bmax[0],bmax[1],bmax[2], duRGBA(255,255,255,128), 1.0f);
//	duDebugDrawCross(&dd, m_center[0], m_center[1], m_center[2], 1.0f, duRGBA(255,255,255,128), 2.0f);
//
//	if (m_cset)
//		duDebugDrawRawContours(&dd, *m_cset);
//
//    if(this->m_tool)
//        m_tool->handleRender();
}

void Sample_Debug::handleRenderOverlay(double* proj, double* model, int* view)
{
    Sample_SoloMeshTiled::handleRenderOverlay(proj, model, view);
}

void Sample_Debug::handleMeshChanged(InputGeom* geom)
{
    Sample_SoloMeshTiled::handleMeshChanged(geom);
}

const float* Sample_Debug::getBoundsMin()
{
    return Sample_SoloMeshTiled::getBoundsMin();

	//if (m_navMesh)
	//	return m_bmin;
	//	
	//if (!m_chf) return 0;
	//return m_chf->bmin;
}

const float* Sample_Debug::getBoundsMax()
{
    return Sample_SoloMeshTiled::getBoundsMax();

	//if (m_navMesh)
	//	return m_bmax;
	//
	//if (!m_chf) return 0;
	//return m_chf->bmax;
}

void Sample_Debug::handleClick(const float* p, bool shift)
{
    Sample_SoloMeshTiled::handleClick(p, shift);

	//if (m_tool)
	//	m_tool->handleClick(p, shift);
}

void Sample_Debug::handleStep()
{
    Sample_SoloMeshTiled::handleStep();

	//if (m_tool)
	//	m_tool->handleStep();
}

bool Sample_Debug::handleBuild()
{
    char sMapID[5];
    sprintf(sMapID, "%.3s", m_meshName);
    int mapID = atoi(sMapID);

    duReadNavMesh(mapID, m_navMesh);

    if(m_tool)
        m_tool->init(this);

    m_drawMode = DRAWMODE_NAVMESH_TRANS;

    return true;

	//delete m_cset;
	//m_cset = 0;
	//
	//// Create contours.
	//m_cset = new rcContourSet;
	//if (!m_cset)
	//{
	//	if (rcGetLog())
	//		rcGetLog()->log(RC_LOG_ERROR, "buildNavigation: Out of memory 'cset'.");
	//	return false;
	//}
	//if (!rcBuildContours(*m_chf, /*m_cfg.maxSimplificationError*/1.3f, /*m_cfg.maxEdgeLen*/12, *m_cset))
	//{
	//	if (rcGetLog())
	//		rcGetLog()->log(RC_LOG_ERROR, "buildNavigation: Could not create contours.");
	//	return false;
	//}
	//
	//return true;
}

/**
 * Copyright (C) 2008 Darshan Sawardekar.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
 
package org.puremvc.as3.multicore.utilities.fabrication.components.fabricator {
	import org.puremvc.as3.multicore.utilities.fabrication.components.FlashApplication;
	import org.puremvc.as3.multicore.utilities.fabrication.components.FlashApplicationMock;
	import org.puremvc.as3.multicore.utilities.fabrication.patterns.mock.SimpleFabricationCommandMock;
	
	import flash.events.Event;	

	/**
	 * @author Darshan Sawardekar
	 */
	public class FlashApplicationFabricatorTest extends AbstractApplicationFabricatorTest {

		public function FlashApplicationFabricatorTest(method:String) {
			super(method);
		}

		override public function setUp():void {
			super.setUp();
		}

		override public function tearDown():void {
			super.tearDown();
		}

		override public function initializeFabrication():void {
			fabrication = new FlashApplicationMock();
			initializeFabricationMock();
		}

		override public function initializeFabricator():void {
			fabricator = new FlashApplicationFabricator(fabrication as FlashApplication);
		}

		override public function initializeFabricationMock():void {
			super.initializeFabricationMock();
		}

		public function testFlashApplicationFabricatorHasValidType():void {
			assertType(FlashApplicationFabricator, fabricator);
		}

		public function testFlashApplicationFabricatorUsesCorrectReadyEventName():void {
			initializeFabrication();
			
			fabricationMock.method("addEventListener").withArgs(Event.ADDED_TO_STAGE, Function).atLeast(1);
			
			initializeFabricator();
			
			assertTrue(fabrication.hasEventListener(Event.ADDED_TO_STAGE));
		}
		
		public function testFlashApplicationFabricatorGetsCorrectStartupCommand():void {
			initializeFabrication();
			fabricationMock.method("getStartupCommand").withNoArgs.returns(SimpleFabricationCommandMock);
			initializeFabricator();
			
			verifyMock(fabricationMock);
			assertEquals(SimpleFabricationCommandMock, fabricator.startupCommand);
		}
		
		public function testFlashApplicationFabricatorDoesNotHaveDefaultStartupCommand():void {
			assertNull(fabricator.startupCommand);
		}
		
	}
}

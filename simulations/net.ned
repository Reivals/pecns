//
// This program is free software: you can redistribute it and/or modify
// it under the terms of the GNU Lesser General Public License as published by
// the Free Software Foundation, either version 3 of the License, or
// (at your option) any later version.
// 
// This program is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
// GNU Lesser General Public License for more details.
// 
// You should have received a copy of the GNU Lesser General Public License
// along with this program.  If not, see http://www.gnu.org/licenses/.
// 


package tcp_adaptive_video.simulations;

import inet.networklayer.configurator.ipv4.Ipv4FlatNetworkConfigurator;
import inet.node.inet.Router;
import inet.node.inet.StandardHost;
import ned.DatarateChannel;


//
// TODO auto-generated type
//
network adaptivestreamingnet
{
    parameters:
        // Channel 1 parameters (to be redefined in .ini file)
        double C1_datarate @unit(bps) = default(100Mbps);
        double C1_delay @unit(s) = default(0.1us);
        double C1_per = default(0);
        double C1_ber = default(0);

        // Channel 2 parameters (to be redefined in .ini file)
        double C2_datarate @unit(bps) = default(4Mbps);
        double C2_delay @unit(s) = default(0.1us);
        double C2_per = default(0);
        double C2_ber = default(0);

        // Channel 3 parameters (to be redefined in .ini file)
        double C3_datarate @unit(bps) = default(4Mbps);
        double C3_delay @unit(s) = default(0.1us);
        double C3_per = default(0);
        double C3_ber = default(0);

    types:
        channel wiredLink extends DatarateChannel
        {
            datarate = C1_datarate;
            delay = C1_delay;
            per = C1_per;
            ber = C1_ber;
        }
        channel wirelessLink extends DatarateChannel
        {
            datarate = C2_datarate;
            delay = C2_delay;
            per = C2_per;
            ber = C2_ber;
        }
        channel externalLink extends DatarateChannel
        {
            datarate = C3_datarate;
            delay = C3_delay;
            per = C3_per;
            ber = C3_ber;
        }

    submodules:
        router: Router {
            @display("p=334.96875,178.65");
        }
        host1: StandardHost {
            @display("p=576.14624,68.4825");
        }
        host2: StandardHost {
            @display("p=708.64496,148.875");
        }
        host3: StandardHost {
            @display("p=708.64496,276.9075");
        }
        host4: StandardHost {
            @display("p=576.14624,381.12");
        }
        server: StandardHost {
            parameters:
                @display("p=96.768745,178.65;i=device/server");
        }
        ipv4FlatNetworkConfigurator: Ipv4FlatNetworkConfigurator {
            @display("p=44.6625,47.64");
        }
    connections:
        host1.pppg++ <--> wiredLink <--> router.pppg++;
        host2.pppg++ <--> wiredLink <--> router.pppg++;
        host3.pppg++ <--> wirelessLink <--> router.pppg++;
        host4.pppg++ <--> wirelessLink <--> router.pppg++;
        router.pppg++ <--> externalLink <--> server.pppg++;
}

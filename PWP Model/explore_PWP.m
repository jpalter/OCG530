% Explore PWP model for OCG530

% 1. Download whole package from Github 2. Read in the data and plot to see
% what the initial and boundary conditions are %  Examine the code to try
% and see how the principles of PWP are implemented 3. Run the code with
% the example data to see what we can learn

load met.mat
load profile.mat

%Water column initial condition 
figure;subplot(1,3,1);
plot(profile.t,profile.z,'linewidth',2);
set(gca,'ydir','reverse','fontsize',14)
xlabel('temperature (deg C)');
ylabel('depth (m)')
subplot(1,3,2)
plot(profile.s,profile.z,'linewidth',2)
xlabel('Absolute Salinity (g/kg)');
set(gca,'ydir','reverse','fontsize',14)
subplot(1,3,3)
plot(profile.d,profile.z,'linewidth',2)
xlabel('\sigma_\theta (kg/m^3)');
set(gca,'ydir','reverse','fontsize',14)

figure;
subplot(3,1,1);
plot(met.time,met.qlat,met.time,met.qsens,'linewidth',2);set(gca,'fontsize',14)
title('Buoyancy fluxes')
legend('latent','sensible'); ylabel('Heat flux (W/m^2)');

subplot(3,1,2);
plot(met.time,met.sw,met.time,met.lw,'linewidth',2);set(gca,'fontsize',14)

ylabel('Heat flux (W/m^2)');
legend('shortwave','longwave');

subplot(3,1,3)
plot(met.time,met.precip,'linewidth',2);set(gca,'fontsize',14)
xlabel('days');
set(gca,'fontsize',14)
ylabel('precip (m/s)')

% Wind stress
figure; title('Wind Stress')
plot(met.time, met.tx,met.time,met.ty,'linewidth',2); set(gca,'fontsize',14)
xlabel('time');ylabel('Wind stress (N/m^2');



%Water column initial condition 
figure;subplot(1,3,1);hold on
plot(profile.t,profile.z,'linewidth',2);
set(gca,'ydir','reverse','fontsize',14)
xlabel('temperature (deg C)');
ylabel('depth (m)')
subplot(1,3,2);hold on;
plot(profile.s,profile.z,'linewidth',2)
xlabel('Absolute Salinity (g/kg)');
set(gca,'ydir','reverse','fontsize',14)
subplot(1,3,3);hold on
plot(profile.d,profile.z,'linewidth',2)
xlabel('\sigma_\theta (kg/m^3)');
set(gca,'ydir','reverse','fontsize',14)

%% RUN THE CODE
PWP_Byron('met.mat','prof.mat','output.mat');

%Water column final condition 
subplot(1,3,1);
plot(pwp_output.t(:,end),pwp_output.z,'linewidth',2);
set(gca,'ydir','reverse','fontsize',14,'YLim',[0 200])
xlabel('temperature (deg C)');
ylabel('depth (m)')
subplot(1,3,2)
plot(pwp_output.s(:,end),pwp_output.z,'linewidth',2)
xlabel('Absolute Salinity (g/kg)');
set(gca,'ydir','reverse','fontsize',14,'YLim',[0 200])
subplot(1,3,3)
plot(pwp_output.d(:,end),pwp_output.z,'linewidth',2)
xlabel('\sigma_\theta (kg/m^3)');
set(gca,'ydir','reverse','fontsize',14,'YLim',[0 200])

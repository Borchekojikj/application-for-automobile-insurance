<?php

namespace App\Console\Commands;

use Illuminate\Console\Command;
use App\Models\Vehicle;
use Carbon\Carbon;
use Illuminate\Console\Scheduling\Schedule;

class CleanUpVehicles extends Command
{
    protected $signature = 'vehicles:cleanup';
    protected $description = 'Delete soft deleted vehicles and expired insurance records';

    public function __construct()
    {
        parent::__construct();
    }

    public function handle()
    {
        $now = Carbon::now();
        Vehicle::onlyTrashed()->where('deleted_at', '<', $now)->forceDelete();
        Vehicle::where('insurance_date', '<', $now)->delete();
        $this->info('Vehicles cleaned up successfully.');
    }

    protected function schedule(Schedule $schedule)
    {
        $schedule->command('vehicles:cleanup')->everyFifteenMinutes();
    }
}
